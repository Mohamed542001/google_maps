import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../core/network/network_service.dart';
import '../feature_data_source/feature_data_source.dart';
import '../models/user.dart';

class FeatureRepository {
  final FeatureDataSource _featureDataSource;

  FeatureRepository(this._featureDataSource);

  Future<NetworkService<User>> getUser(int id) async {
    try {
      return NetworkService.succeed(
        User.fromJson(await _featureDataSource.getUser(id: id)),
      );
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
