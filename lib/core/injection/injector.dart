import 'package:google_maps/features/map_screen/cubit/map_cubit.dart';
import 'package:google_maps/features/map_screen/data/map_data_source/map_data_source.dart';
import 'package:google_maps/features/map_screen/data/repository/map_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/feature/cubit/feature_cubit.dart';
import '../../features/feature/data/feature_data_source/feature_data_source.dart';
import '../../features/feature/data/repository/feature_repository.dart';
import '../network/dio_helper.dart';
import '../src/app_export.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<FeatureBloc>(() => FeatureBloc(getIt()));
  getIt.registerFactory<LocalizationBloc>(() => LocalizationBloc());
  getIt.registerFactory<MapCubit>(() => MapCubit(getIt()));

  /// Data Sources
  getIt.registerLazySingleton<FeatureDataSource>(
      () => FeatureDataSource(getIt()));
  getIt.registerLazySingleton<MapDataSource>(
      () => MapDataSource(getIt()));

  /// Repository
  getIt.registerLazySingleton<FeatureRepository>(
      () => FeatureRepository(getIt()));
  getIt.registerLazySingleton<MapRepository>(
      () => MapRepository(getIt()));

  /// SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(
          () async => await SharedPreferences.getInstance());

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());
}
