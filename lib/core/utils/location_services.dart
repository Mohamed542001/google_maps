import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationServices{

  Location location = Location();

  //location service
  Future<bool> checkAndRequestLocationServices()async{
    var serviceEnabled = await location.serviceEnabled();

    if(!serviceEnabled){
      serviceEnabled = await location.requestService();
      if(!serviceEnabled) {
        return false;
      }
    }
    return true;
  }

  //location permission
  Future<bool> checkAndRequestLocationPermission()async{
    var permissionStatus = await location.hasPermission();
    if(permissionStatus == PermissionStatus.deniedForever){
      return false;
    }
    if(permissionStatus == PermissionStatus.denied){
      permissionStatus = await location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    }
    return true;
  }


  //location data
  void getRealTimeLocationData(void Function(LocationData)? onData)async{
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen(onData);
  }


}