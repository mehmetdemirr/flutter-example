import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  Future<void> setData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedValue.data.NameValue(), data);
  }

  Future<String?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedValue.data.NameValue());
  }

}

enum SharedValue {
  data;
}

extension Shared on SharedValue {
  String NameValue() {
    switch (this) {
      case SharedValue.data:
        return "data";
    }
  }
}
