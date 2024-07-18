import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationServices{

  Location location = Location();

  //location service
  Future<void> checkAndRequestLocationServices()async{
    var serviceEnabled = await location.serviceEnabled();

    if(!serviceEnabled){
      serviceEnabled = await location.requestService();
      if(!serviceEnabled) {
        throw LocationServiceException();
      }
    }
  }

  //location permission
  Future<void> checkAndRequestLocationPermission()async{
    var permissionStatus = await location.hasPermission();
    if(permissionStatus == PermissionStatus.deniedForever){
      throw LocationPermissionException();
    }
    if(permissionStatus == PermissionStatus.denied){
      permissionStatus = await location.requestPermission();
      if(permissionStatus != PermissionStatus.granted){
        throw LocationPermissionException();
      }
    }
  }


  //location data
  void getRealTimeLocationData(void Function(LocationData)? onData)async{
    await checkAndRequestLocationServices();
    await checkAndRequestLocationPermission();
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen(onData);
  }


  Future<LocationData> getLocation()async{
    await checkAndRequestLocationServices();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }
}


class LocationServiceException implements Exception{}
class LocationPermissionException implements Exception{}