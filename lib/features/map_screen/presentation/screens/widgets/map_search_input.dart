import 'package:google_maps/core/constants/custom_input_field.dart';
import 'package:google_maps/core/src/app_export.dart';
import 'package:google_maps/core/utils/google_maps_places_services.dart';
import 'package:google_maps/features/map_screen/cubit/map_cubit.dart';

class MapSearchInput extends StatelessWidget {
  const MapSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit,MapState>(
      builder: (context,state) {
        var cubit = MapCubit.get(context);
        return InputFormField(
          hint: 'Search here',
          isRTL: false,
          controller: cubit.searchController,
          onChanged: (v){
            cubit.getPredictionPlaces(input: cubit.searchController.text
            );
          },
        );
      }
    );
  }
}
