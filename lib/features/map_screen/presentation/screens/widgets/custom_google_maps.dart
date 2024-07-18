import 'package:google_maps/core/src/app_export.dart';
import 'package:google_maps/features/map_screen/cubit/map_cubit.dart';

class CustomGoogleMaps extends StatelessWidget {
  const CustomGoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit,MapState>(
      builder: (context,state) {
        var cubit = MapCubit.get(context);
        return GoogleMap(
        onMapCreated: (controller) {
          cubit.googleMapController = controller;
          cubit.initMapStyle(context);
          cubit.updateCurrentLocation();

        },
        zoomControlsEnabled: false,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
            0.0,
            0.0 ,
          ),
          /* zoom levels */
          // world view ======> 0   to  3
          // country view ====> 4   to  6
          // city view  ======> 10  to  12
          // street view =====> 13  to  17
          // building view ===> 18  to  20
          zoom: 18,
        ),
        /* تحديد النطاق المتاح التحرك فيه حول نقطة البداية */
        // cameraTargetBounds: CameraTargetBounds(
        //   LatLngBounds(
        //     southwest: LatLng(31.273256, 31.676830),
        //     northeast: LatLng(31.278813, 31.688868),
        //   ),
        // ),

        /*Customize map style*/
        mapType: MapType.normal,

        /*markers*/
        markers: cubit.markers,

        /*polylines(اكتر من خط متوصلين ببعض)*/
        // polylines: cubit.polyLines,

        /*polylines(شكل مجسم يكون نقطه البدايه هي نقطة النهاية*/
        // polygons: cubit.polygons,

        // circles: cubit.circles,
      );
      },
    );
  }
}
