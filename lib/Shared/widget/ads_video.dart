// import 'package:fawry/Shared/widget/VideoPlayerFullscreen.dart';
// import 'package:fawry/app/data/Services/get_ads.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:video_player/video_player.dart';

// class ADS extends StatefulWidget {
//   const ADS({Key? key}) : super(key: key);

//   @override
//   State<ADS> createState() => _ADSState();
// }

// class _ADSState extends State<ADS> {
//   var categoriesLis = [].obs;
//   final count = 0.obs;
//   final email = GetStorage().read('email');
//   //TODO: Implement ServicesController
//   // var controllerServices = Get.put(ServicesController());

//   var id;

//   var isLoading = true.obs;
//   final token = GetStorage().read('Token');

//   void fetchMYAds() async {
//     try {
//       isLoading(true);

//       var vendors = await GetAds(token);
//       categoriesLis.value = vendors.data!;

//       print('Vendors Here');

//       print(categoriesLis);
//     } finally {
//       isLoading(false);
//     }
//   }

//   late VideoPlayerController controller;
//   final assets = 'assets/images/voisess.mp4';
//   final onBoarding = GetStorage().read('onBoardin');
//   @override
//   void initState() {
//     super.initState();
//     fetchMYAds();
//     controller =
//     //
//     // = categoriesLis[0].advertisementsID == 1
//     //     ? VideoPlayerController.network(assets)
//     //     :
        
//          VideoPlayerController.asset(assets)
//       ..addListener(() => setState(() {
//             // Implement your calls inside these conditions' bodies :
//             if (controller.value.position ==
//                 const Duration(seconds: 0, minutes: 0, hours: 0)) {
//               print('video Started');
//             }

//             if (controller.value.position == controller.value.duration) {
//               print('video Ended');
//             }
//           }))
//       ..setLooping(false)
//       ..initialize().then((_) => controller.play());
//     checkStat();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   checkStat() {
//     if (onBoarding != 0) {
//       GetStorage().write('loginStat', 'notLogin');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMuted = controller.value.volume == 0;


//     return VideoPlayerFullscreenWidget(controller: controller);
//   }
// }
