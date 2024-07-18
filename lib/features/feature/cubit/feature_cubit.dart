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


}
