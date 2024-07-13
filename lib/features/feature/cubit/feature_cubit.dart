import '../../../core/src/app_export.dart';
import '../data/models/user.dart';
import '../data/repository/feature_repository.dart';

part 'feature_state.dart';

class FeatureBloc extends Cubit<FeatureState> {
  final FeatureRepository _featureRepository;
  FeatureBloc(
    this._featureRepository,
  ) : super(FeatureIdle());

  static FeatureBloc get(context) => BlocProvider.of<FeatureBloc>(context);

  late User? _user;
  User? get user => _user;

  void getUser(int id) async {
    emit(FeatureLoading());
    NetworkService<User> data = await _featureRepository.getUser(id);
    switch (data) {
      case Succeed<User>(data: User userData):
        _user = userData;
        emit(FeatureSuccess());

      case Failure<User>(networkExceptions: NetworkExceptions error):
        emit(FeatureError(networkExceptions: error));
    }
  }
}
