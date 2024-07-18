import 'package:dio/dio.dart';
import 'package:google_maps/core/constants/constants.dart';

import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';

class MapDataSource {
  final BaseDioHelper baseDioHelper;

  MapDataSource(this.baseDioHelper);

  Future getPredictionPlaces({required String input}) async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.autocomplete,
        query: {
          'key':AppConstants.apiKey,
          'input':input
        }
    );
    return response.data['predictions'];
  }
}
