import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/modules/Activitys/controllers/activitys_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final cont = Get.put(ActivitysController());

bool isPaid = true;
Activity? activitiesModel;
Future<Activity> GetActivity(
  String email,
  dynamic token,
) async {
  final Map<String, dynamic> Data = {'Email': email};
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}Companies'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Data),
  );
  // print(jsonDecode(response.body));
  // return User.fromJson(jsonDecode(response.body));
var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    var jsonString = response.body;
    print(jsonDecode(response.body));

  //   jsonDecode(response.body)['data'].forEach((element) {
  //     element['subscription']!.forEach((index1) {
      
  //        cont.check = index1['subscriptionID'];
  // print('${cont.check}');

  //     });
  //   });
    //   var i =jsonDecode(response.body)['data'][0]['subscription'];
    // print(i.toString());
    // activitiesModel = Activity.fromJson(json.decode(response.body));

    return userDataFromJson(jsonString);
  }
  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body));

  return Future.error(jsonDecode(response.body.toString()));
}
