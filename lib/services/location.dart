import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  double? latitude;
  double? longitude;

  // Location(this.latitude, this.longitude);
  Future<void> getCurrentLocation() async {
    try {
      final bool isgranted = await Permission.location.isGranted;
      if (!isgranted) {
        await Permission.location.request();
      }
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
