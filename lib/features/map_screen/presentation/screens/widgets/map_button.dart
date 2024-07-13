import 'package:google_maps/core/src/app_export.dart';
import 'package:google_maps/features/map_screen/cubit/map_cubit.dart';

class MapButton extends StatelessWidget {
  const MapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit,MapState>(
      builder: (context,state) {
        var cubit = MapCubit.get(context);
        return ElevatedButton(
            onPressed: () {
              /*Update camera position*/
              cubit.googleMapController?.animateCamera(
                CameraUpdate.newLatLng(
                  const LatLng(31.273256, 31.676830),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Change Location'),
                Image.asset(
                  'assets/images/marker.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ));
      },
    );
  }
}
