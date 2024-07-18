import 'package:google_maps/features/map_screen/data/models/prediction_place_model.dart';

import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../core/network/network_service.dart';
import '../map_data_source/map_data_source.dart';

class MapRepository {
  final MapDataSource _mapDataSource;

  MapRepository(this._mapDataSource);

  Future<NetworkService<List<PredictionPlaceModel>>> getPredictionPlaces({required String input}) async {
    try {
      List<dynamic> response = await _mapDataSource.getPredictionPlaces(input: input);
      List<PredictionPlaceModel> reelsData =
      response.map((data) => PredictionPlaceModel.fromJson(data)).toList();
      print("success");
      return NetworkService.succeed(reelsData);
    } catch (error) {
      print("error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
