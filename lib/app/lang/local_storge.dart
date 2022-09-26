import 'package:get_storage/get_storage.dart';

class LocalStorage {
  /// Write
  void saveLanguageToDisk(String langusage, String langusageCode) async {
    await GetStorage().write('lang', langusage);
    await GetStorage().write('langCode', langusageCode);
  }

  /// Read
  Future<String> get languageSelected async {
    return await GetStorage().read('lang');
  }
}
