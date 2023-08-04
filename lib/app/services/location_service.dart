import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart' hide PermissionStatus;

class LocationService {

  LocationService._();

  // location service to get user current location
  static final Location _location = Location();

  // if location service started successfully
  static bool _serviceEnabled = false;

  // check if user granted permission to use location
  static bool _permissionGranted = false;

  // check if user granted permission from setting screen to use location
  static bool _manualPermissionGranted = false;

  // user location (will be set if the location service worked fine and we got user location else it will remain null)
  static LocationData? _locationData;


  /// initialize location service to get user current location
  static Future<void> initLocationService() async {

    try {
      // *) start location service
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
        if (!_serviceEnabled) {

          return; // stop function if sth wrong went with service
        }
      }

      // *) check if user granted permission to use location
      var permissionStatus = (await _location.hasPermission());
      // Logger().w(permissionStatus);
      _permissionGranted = permissionStatus == PermissionStatus.granted ||
          permissionStatus == PermissionStatus.grantedLimited;
      if (!_permissionGranted) {
        var per = await _location.requestPermission();
        _permissionGranted = per == PermissionStatus.granted ||
            per == PermissionStatus.grantedLimited;
        if (!_permissionGranted) {

          _manualPermissionGranted = await openAppSettings();
          if(!_manualPermissionGranted){
            return;
          }
        }
      }

      // *) user location data (current location & other info)
      _locationData = await _location.getLocation();

      // *) send user location to api
      if (_locationData!.latitude != null && _locationData!.longitude != null) {}

      // *) keep listening to user location
      // location.onLocationChanged.listen((LocationData currentLocation) {
      //
      // });
    } on PlatformException {

      _manualPermissionGranted = await openAppSettings();
      if(!_manualPermissionGranted){
        return;
      }
    } catch(e){
      Logger().e(e);
      return;
    }
  }



  static LocationData? getLocationData() {
    return _locationData;
  }
  
  
}