import 'package:google_maps/core/src/app_export.dart';
import 'package:google_maps/features/map_screen/cubit/map_cubit.dart';
import 'package:google_maps/features/map_screen/presentation/screens/widgets/custom_google_maps.dart';
import 'package:google_maps/features/map_screen/presentation/screens/widgets/map_search_input.dart';
import 'package:google_maps/features/map_screen/presentation/screens/widgets/search_items_view.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  late MapCubit cubit;

  @override
  void initState() {
    cubit = MapCubit.get(context);
    cubit.initMarkers();
    // cubit.updateCurrentLocation();
    // cubit.updateMyLocation();
    // cubit.initPolyLines();
    // cubit.initPolygons();
    // cubit.initCircles();
    super.initState();
  }

  @override
  void dispose() {
    cubit.googleMapController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit,MapState>(
        builder: (context,state) {
          return Stack(
            children: [
              const CustomGoogleMaps(),
              Positioned(
                top: 32,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    const MapSearchInput(),
                    if(cubit.predictionPlaces.isNotEmpty)SearchItemsView(predictionPlaces: cubit.predictionPlaces,),
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
