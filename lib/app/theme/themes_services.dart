import 'package:fawry_app/Shared/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Thm {
  static ThemeData th1 = ThemeData.dark().copyWith(
   
      primaryColor:Color(0xFF191970),
      hintColor: kwhite,
      primaryColorDark: Colors.white, // TEXT BASIC
      primaryColorLight: Color(0xFF191970), // BOX
      scaffoldBackgroundColor: Colors.black,
      dividerColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: kwhite),
          textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Color(0xFF191970))
          
          
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color(0xFF3B3B98),
              textStyle: const TextStyle(color: Colors.blue))),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        headline3: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: kgreyLight),
        headline4:
            TextStyle(color: kwhite, fontSize: 12, fontWeight: FontWeight.w700),
        headline5:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: kwhite),
        headline6: TextStyle(color: Colors.white),
        subtitle1:
            TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.w700),
        subtitle2: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: kgreyLight),
        button: TextStyle(
          color: kwhite,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ));
  static ThemeData th2 = ThemeData.light().copyWith(
    primaryColor: Color(0xFF3B3B98),
    primaryColorDark: Color(0xFF3B3B98), // TEXT BASIC
    primaryColorLight: kwhite, // BOX
    hintColor: kblack,
    scaffoldBackgroundColor: Color(0xffE5E5E5),
    dividerColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffE5E5E5),
      shadowColor: Color(0xffE5E5E5),
      titleTextStyle: TextStyle(color: kblack),
      
          iconTheme: IconThemeData(color: Color(0xFF3B3B98))
    ),
  
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: const Color(0xFF3B3B98),
            textStyle: const TextStyle(color: Colors.blue))),
    textTheme: TextTheme(
      headline1: TextStyle(color: Color(0xFF3B3B98)),
      headline2: TextStyle(color: Color(0xFF3B3B98)),
      headline3:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: kblack),
      headline4:
          TextStyle(color: kblack, fontSize: 12, fontWeight: FontWeight.w700),
      headline5: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF3B3B98)),
      headline6: TextStyle(color: Color(0xFF3B3B98)),
      subtitle1:
          TextStyle(color: kblack, fontSize: 18, fontWeight: FontWeight.w700,),
      subtitle2: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: kgreyPrimery),
      button: TextStyle(
        color: kwhite,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  static ThemeData th3 = ThemeData.light().copyWith(
      primaryColor: Color(0xFF008080),
      primaryColorDark: Color(0xFF008080), // TEXT BASIC
      primaryColorLight: kwhite, // BOX
   scaffoldBackgroundColor: Color(0xffE5E5E5),
      dividerColor: Colors.transparent,
      hintColor: kblack,
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffE5E5E5),
          shadowColor: Color(0xffE5E5E5),
          titleTextStyle: TextStyle(color: kblack),
          textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Color(0xFF008080))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color(0xFF008080),
              textStyle: const TextStyle(color: Colors.blue))),
      textTheme: TextTheme(
        headline1: TextStyle(color: Color(0xFF008080)),
        headline2: TextStyle(color: Color(0xFF008080)),
        headline3:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: kblack),
        headline4:
            TextStyle(color: kblack, fontSize: 12, fontWeight: FontWeight.w700),
        headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF008080)),
        headline6: TextStyle(color: Color(0xFF008080)),
        subtitle1:
            TextStyle(color: kblack, fontSize: 18, fontWeight: FontWeight.w700),
        subtitle2: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: kgreyPrimery),
        button: TextStyle(
          color: kwhite,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ));
  static ThemeData th4 = ThemeData.light().copyWith(
      primaryColor: Color(0xff663399),
      primaryColorDark: Color(0xff663399), // TEXT BASIC
      primaryColorLight: kwhite, // BOX
      scaffoldBackgroundColor: Color(0xffE5E5E5),
      dividerColor: Colors.transparent,
      hintColor: kblack,
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffE5E5E5),
          shadowColor: Color(0xffE5E5E5),
          titleTextStyle: TextStyle(color: kblack),
          textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Color(0xff663399))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color(0xff663399),
              textStyle: const TextStyle(color: Colors.blue))),
      textTheme: TextTheme(
        headline1: TextStyle(color: Color(0xff663399)),
        headline2: TextStyle(color: Color(0xff663399)),
        headline3:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: kblack),
        headline4:
            TextStyle(color: kblack, fontSize: 12, fontWeight: FontWeight.w700),
        headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff663399)),
        headline6: TextStyle(color: Color(0xff663399)),
        subtitle1:
            TextStyle(color: kblack, fontSize: 18, fontWeight: FontWeight.w700),
        subtitle2: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: kgreyPrimery),
        button: TextStyle(
          color: kwhite,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ));
  static ThemeData th5 = ThemeData.light().copyWith(
      primaryColor: Color(0xffDAA520),
      primaryColorDark: Color(0xffDAA520), // TEXT BASIC
      primaryColorLight: kwhite, // BOX
      scaffoldBackgroundColor: Color(0xffE5E5E5),
      dividerColor: Colors.transparent,
      hintColor: kblack,
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffE5E5E5),
          shadowColor: Color(0xffE5E5E5),
          titleTextStyle: TextStyle(color: kblack),
          textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Color(0xffDAA520))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color(0xffDAA520),
              textStyle: const TextStyle(color: Colors.blue))),
      textTheme: TextTheme(
        headline1: TextStyle(color: Color(0xffDAA520)),
        headline2: TextStyle(color: Color(0xffDAA520)),
        headline3:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: kblack),
        headline4:
            TextStyle(color: kblack, fontSize: 12, fontWeight: FontWeight.w700),
        headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xffDAA520)),
        headline6: TextStyle(color: Color(0xffDAA520)),
        subtitle1:
            TextStyle(color: kblack, fontSize: 18, fontWeight: FontWeight.w700),
        subtitle2: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: kgreyPrimery),
        button: TextStyle(
          color: kwhite,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ));
  static ThemeData th6 = ThemeData.light().copyWith(
      primaryColor: Color(0xff5d1049),
      primaryColorDark: Color(0xff5d1049), // TEXT BASIC
      primaryColorLight: kwhite, // BOX
      hintColor: kblack,
      scaffoldBackgroundColor: Color(0xffE5E5E5),
      dividerColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffE5E5E5),
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(color: kblack),
          textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Color(0xff5d1049),)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color(0xff5d1049),
              textStyle: const TextStyle(color: Colors.blue))),
      textTheme: TextTheme(
        subtitle1:
            TextStyle(color: kblack, fontSize: 18, fontWeight: FontWeight.w700),
        headline2: TextStyle(color: Color(0xff5d1049)),
        headline3:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: kblack),
        headline4:
            TextStyle(color: kblack, fontSize: 12, fontWeight: FontWeight.w700),
        headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff5d1049)),
        headline6: TextStyle(color: Color(0xff5d1049)),
        headline1: TextStyle(color: Color(0xff5d1049)),
        subtitle2: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: kgreyPrimery),
        button: TextStyle(
          color: kwhite,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ));
}

class ThemeHelper {
  static final _box = GetStorage();
  static const String _key = 'mod';

  static ThemeData myTheme() {
    String mod = _box.read(_key).toString();
    if (mod == 'th1') {
      return Thm.th1;
    } else if (mod == 'th2') {
      return Thm.th2;
    } else if (mod == 'th3') {
      return Thm.th3;
    } else if (mod == 'th4') {
      return Thm.th4;
    } else if (mod == 'th5') {
      return Thm.th5;
    } else if (mod == 'th6') {
      return Thm.th6;
    } else {
      return Thm.th2;
    }
  }

  static saveThemeToBox(String mode) => _box.write(_key, mode);

  /// Switch theme and save to local storage
  static void switchTheme(String mod) {
    Get.changeTheme(myTheme());
    saveThemeToBox(mod);
  }
}
