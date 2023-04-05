import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GeolocaterController extends GetxController {
  bool isLoading = false;
  bool isRequiredPermission = false;
  Position? currentLocation;

  Future<Position?> getLocation() async {
    print("get location start");
    var perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      return null;
    }
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .catchError((e) {
      print("Eror:$e");
    });
  }

  void permissionOK() {
    getLocation().then((pos) {
      isLoading = true;
      currentLocation = pos;
      if (pos == null) {
        isRequiredPermission = true;
      } else {
        isRequiredPermission = false;
      }
    });
  }
}
