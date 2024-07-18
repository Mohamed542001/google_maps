part of 'map_cubit.dart';

class MapState {}

class MapIdle extends MapState {}

class MapLoading extends MapState {}

class MapSuccess extends MapState {}
class SetCurrentLocationSuccess extends MapState {}
class AddMarkerSuccess extends MapState {}
class UpdateCurrentLocationSuccess extends MapState {}

class MapError extends MapState {
  final NetworkExceptions networkExceptions;
  MapError({
    required this.networkExceptions,
  });
}

class PredictionPlacesSuccess extends MapState {}

class PredictionPlacesError extends MapState {
  final NetworkExceptions networkExceptions;
  PredictionPlacesError({
    required this.networkExceptions,
  });
}
