import 'package:fawry_app/app/data/Services/get_Items.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ItemsController extends GetxController {
  //TODO: Implement ItemsController
final companyID = Get.arguments[0];
  var itemsListL = 0.obs;
  var itemsLis = [].obs;
  final count = 0.obs;
  final email = GetStorage().read('email');
  //TODO: Implement ServicesController
    // var controllerServices = Get.put(ServicesController());

var id;

  var isLoading = true.obs;
final token = GetStorage().read('Token');

  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
 
    fetchMYItems();
    print("&&&&&&&&&&&&&&&&&&&&");
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;

  void fetchMYItems() async {
    try {
  isLoading(true);     
   var vendors = await GetItems(companyID,token);
      itemsLis.value = vendors.data!;
      itemsListL.value = vendors.data!.length;

      print('Vendors Here');

      print(itemsLis);
      print(itemsListL);
         
      update();
     } finally {
      isLoading(false);
    }
  }

}
