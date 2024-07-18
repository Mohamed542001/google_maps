import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps/core/src/app_export.dart';
import 'package:google_maps/features/map_screen/data/models/prediction_place_model.dart';

class SearchItemsView extends StatelessWidget {
  const SearchItemsView({super.key, required this.predictionPlaces});
  final List<PredictionPlaceModel> predictionPlaces;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: ListView.separated(
        padding: EdgeInsets.all(10.r),
        shrinkWrap: true,
        itemCount: predictionPlaces.length,
      itemBuilder: (context,i)=>ListTile(
        leading: const Icon(
            FontAwesomeIcons.mapPin,
        ),
        title: Text(predictionPlaces[i].description??''),
        trailing: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.arrow_circle_right_outlined
          ),
        ),
      ),
      separatorBuilder: (context,i)=>const Divider(
        height: 0,
      ),
      ),
    );
  }
}
