part of 'map_cubit.dart';

class MapState {}

class MapIdle extends MapState {}

class MapLoading extends MapState {}

class MapSuccess extends MapState {}
class SetCurrentLocationSuccess extends MapState {}
class AddMarkerSuccess extends MapState {}

class MapError extends MapState {
  final NetworkExceptions networkExceptions;
  MapError({
    required this.networkExceptions,
  });
}
