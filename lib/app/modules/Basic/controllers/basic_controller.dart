import 'package:get/get.dart';

class BasicController extends GetxController {
  //TODO: Implement BasicController

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // this.GetGuestID();
    //this.GetToken();
    // GetLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  // void GetLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   print(position);
  // }

//
  ///Check If The User Is Registered or Guest
//
  // var token;
  // var guest_id;
  // void GetGuestID() {
  //   var ktoken = GetStorage().read('Token');
  //   guest_id = GetStorage().read('Token');
  //   if (ktoken != null) {
  //     token = 'Bearer ' + ktoken;
  //     print(token);
  //   } else
  //     print(guest_id);
  //   // if (GetStorage().read('guest_id') == null) {
  //   //   guest_id.value = 'null';
  //   //   token.value = 'null';
  //   //   print(loginStatController.loginState);
  //   //   print(guest_id);
  //   // } else {
  //   //   guest_id.value = GetStorage().read('guest_id');
  //   //   token.value = GetStorage().read('Token');
  //   //   token.value = 'null';
  //   //   print('Guest User');
  //   //   print(loginStatController.loginState);
  //   //   print(guest_id);
  //   //   print(token);
  //   // }
  // }

  // void GetToken() {
  //   if (loginStatController.loginState != 'Login') {
  //     token.value = 'null';
  //     print(token);
  //   } else {
  //     token.value = GetStorage().read('Token');
  //     guest_id.value = 'null';
  //     print(token);
  //     print('Registerd User');
  //   }
  // }
}
