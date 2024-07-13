part of 'feature_cubit.dart';

class FeatureState {}

class FeatureIdle extends FeatureState {}

class FeatureLoading extends FeatureState {}

class FeatureSuccess extends FeatureState {}

class FeatureError extends FeatureState {
  final NetworkExceptions networkExceptions;
  FeatureError({
    required this.networkExceptions,
  });
}
