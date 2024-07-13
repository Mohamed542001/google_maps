
import 'package:google_maps/core/src/app_export.dart';
import 'package:google_maps/features/map_screen/cubit/map_cubit.dart';
import 'package:google_maps/features/map_screen/presentation/screens/widgets/custom_google_maps.dart';
import 'package:google_maps/features/map_screen/presentation/screens/widgets/map_button.dart';

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
    cubit.updateMyLocation();
    cubit.initPolyLines();
    cubit.initPolygons();
    cubit.initCircles();
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
          return const Stack(
            children: [
              CustomGoogleMaps(),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: MapButton(),
              )
            ],
          );
        }
      ),
    );
  }
}
