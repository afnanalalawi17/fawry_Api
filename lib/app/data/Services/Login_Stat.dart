import 'package:get_storage/get_storage.dart';

class LoginState {
  /// Write
  void saveLoginStatToDisk(String state) async {
    await GetStorage().write('loginStat', state);
  }

  /// Read
  Future<String> get loginStateSelected async {
    return await GetStorage().read('loginStat');
  }
}
