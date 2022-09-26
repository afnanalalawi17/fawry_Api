import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
             Container(
              padding: EdgeInsets.all(30),
          alignment: Alignment.topRight,
          
          child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
          primary:Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
                child: Text("تخطي"),
                onPressed: (){
                  
                   Get.offAndToNamed(Routes.BASIC);
                   },),
        ),  
            // buildPlay(),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   // child: buildIndicator(),
            // ),
          ],
        ),
      );

  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: false,
      );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.topRight,
          color: Colors.black26,
          child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );
}