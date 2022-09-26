import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetialsStockComprehensiveController extends GetxController {
  //TODO: Implement DetialsStockComprehensiveController
 final email = GetStorage().read('email');
final token = GetStorage().read('Token');
  var isLoading = true.obs;
 var companyID;
var itemEName;
var itemAName;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchMYActivity();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  List<DataCompany> ActivityList = [];
  void fetchMYActivity() async {
    try {
      isLoading(true);
      var vendors = await GetActivity(email, token);
      ActivityList = vendors.data!;
      update();
    } finally {
      isLoading(false);
    }
  }
 
}
