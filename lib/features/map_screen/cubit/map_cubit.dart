import 'dart:ui';
import 'package:google_maps/core/utils/location_services.dart';
import 'package:google_maps/features/map_screen/data/models/place_model.dart';
import 'package:location/location.dart';

import '../../../core/src/app_export.dart';
import '../data/repository/map_repository.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final MapRepository _featureRepository;
  MapCubit(
    this._featureRepository,
  ) : super(MapIdle());

  static MapCubit get(context) => BlocProvider.of<MapCubit>(context);

  GoogleMapController? googleMapController;
  LocationServices mapServices = LocationServices();
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  Set<Polygon> polygons = {};
  Set<Circle> circles = {};
  double? currentLat = 0.0;
  double? currentLng = 0.0;
  bool isFirstCall = true;

  List<PlaceModel> places = [
    PlaceModel(
      id: 1,
      name: 'شارع الصاري',
      lat: 31.281529,
      lng: 31.677191,
    ),
    PlaceModel(
      id: 2,
      name: 'مسجد البحر',
      lat: 31.28180815947351,
      lng: 31.67713459187959,
    ),
    PlaceModel(
      id: 3,
      name: 'المجمع الخيري بشرباص',
      lat: 31.28145904461904,
      lng: 31.676276740873252,
    ),
  ];

  void initMapStyle(BuildContext context) async {
    var nightStyle = await DefaultAssetBundle.of(context).loadString('assets/styles/night_map_style.json');
    googleMapController?.setMapStyle(nightStyle);
  }


  void updateMyLocation() async{
    await mapServices.checkAndRequestLocationServices();
    var hasPermission = await mapServices.checkAndRequestLocationPermission();
    if(hasPermission){
      mapServices.getRealTimeLocationData((locationData) {
        setCurrentLocationMarker(locationData);
        updateMyCamera(locationData);

      });
    }
  }


  void setCurrentLocationMarker(LocationData locationData ){
    var currentLocationMarker = Marker(markerId: const MarkerId('currentLocationMarker'),
        position: LatLng(locationData.latitude!, locationData.longitude!));
    markers.add(currentLocationMarker);
    emit(SetCurrentLocationSuccess());
  }

  void updateMyCamera(LocationData locationData){
    if(isFirstCall){
      var cameraPosition = CameraPosition(target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 18,
      );
      googleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      isFirstCall = false;
    }else{
      var cameraPosition =LatLng(locationData.latitude!, locationData.longitude!);
      googleMapController?.animateCamera(CameraUpdate.newLatLng(cameraPosition));
    }

  }


  Future<Uint8List> getMarkerImage(String image, double width) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await instantiateImageCodec(imageData.buffer.asUint8List(),
        targetWidth: width.round());
    var imageFrame = await imageCodec.getNextFrame();
    var byteImage =
    await imageFrame.image.toByteData(format: ImageByteFormat.png);

    return byteImage!.buffer.asUint8List();
  }

  void initMarkers() async {
    // var myMarker = const Marker(markerId: MarkerId('1'),position: LatLng(
    //   31.281619,
    //   31.677023,
    // ),
    // );
    // markers.add(myMarker);
    var markerIcon = BitmapDescriptor.fromBytes(
        await getMarkerImage('assets/images/marker.png', 120));
    // await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(
    //       size: Size.fromHeight(250)
    //     ), 'assets/images/marker.png',);
    var myMarkers = places
        .map(
          (e) => Marker(
        markerId: MarkerId(e.id.toString()),
        infoWindow: InfoWindow(title: e.name),
        icon: markerIcon,
        position: LatLng(e.lat, e.lng),
      ),
    )
        .toSet();

    markers.addAll(myMarkers);
    emit(AddMarkerSuccess());
  }

  void initPolyLines() {
    Polyline polyline = Polyline(
      polylineId: const PolylineId('1'),
      onTap: () {
        print('object');
      },
      width: 5,
      zIndex: 1,
      startCap: Cap.roundCap,
      color: Colors.white,
      points: [
        const LatLng(31.28180815947351, 31.67713459187959),
        const LatLng(31.281529, 31.677191),
        const LatLng(31.28145904461904, 31.676276740873252),
      ],
    );
    Polyline polyline2 = Polyline(
      polylineId: const PolylineId('2'),
      onTap: () {
        print('object');
      },
      width: 5,
      zIndex: 0,
      patterns: [PatternItem.dot],
      startCap: Cap.roundCap,
      color: Colors.red,
      points: [
        const LatLng(31.281174331696736, 31.676710122811418),
        const LatLng(31.28220228995134, 31.676138115966754),
      ],
    );
    polyLines.add(polyline);
    polyLines.add(polyline2);
  }

  void initPolygons() {
    Polygon polygon = Polygon(
        polygonId: const PolygonId('value'),
        fillColor: Colors.black.withOpacity(0.5),
        strokeColor: Colors.black.withOpacity(0.5),
        strokeWidth: 1,
        holes: [
          [
            const LatLng(31.28162663471417, 31.67705225773795),
            const LatLng(31.28174998970471, 31.677036220162865),
            const LatLng(31.281667753062287, 31.67681169411169),
          ],
        ],
        points: [
          const LatLng(31.28180815947351, 31.67713459187959),
          const LatLng(31.281529, 31.677191),
          const LatLng(31.28145904461904, 31.676276740873252),
          // LatLng(31.28180815947351, 31.67713459187959),
        ]);
    polygons.add(polygon);
  }

  void initCircles() {
    Circle circle = const Circle(
        circleId: CircleId('1'),
        center: LatLng(31.28095503249046, 31.675833402031557),
        radius: 20,
        fillColor: Colors.white
    );
    circles.add(circle);
  }

}
