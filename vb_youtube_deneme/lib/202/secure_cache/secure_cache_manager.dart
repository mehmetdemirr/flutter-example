import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheManager {
  Future<String> getCounter() async {
    const storage = FlutterSecureStorage();
    return (await storage.read(key: SecureCache.counter.name)) ?? "";
  }

  Future<void> setCounter(String data) async {
    const storage = FlutterSecureStorage();
   await storage.write(key:SecureCache.counter.name, value:data);
  }
}

enum SecureCache{
  counter,
}
