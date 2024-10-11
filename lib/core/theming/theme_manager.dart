import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';

class ThemeManager {
  static ThemeData mainTheme = ThemeData(
      scaffoldBackgroundColor: ColorsManager.white,
      primaryColor: ColorsManager.blueBase,
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          color: ColorsManager.white,
          titleTextStyle:TextStyle(color: ColorsManager.blackBase, fontSize: 20.sp, fontWeight: FontWeight.w500,)),
          textTheme:  TextTheme(
          titleLarge: TextStyle(color: ColorsManager.blackBase, fontSize: 18.sp, fontWeight: FontWeight.w500,),
          labelSmall: TextStyle(color: ColorsManager.grey, fontSize: 12.sp, fontWeight: FontWeight.w400,),
          bodyMedium:  TextStyle(color: ColorsManager.blackBase, fontSize: 14.sp, fontWeight: FontWeight.w400,)),
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.lightBlue,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor:  ColorsManager.blueBase,
        unselectedItemColor: ColorsManager.blackBase ,
        selectedLabelStyle: TextStyle(color: ColorsManager.blueBase,fontSize: 12.sp,fontWeight: FontWeight.w500),
        unselectedLabelStyle:TextStyle(color: ColorsManager.blackBase,fontSize: 12.sp,fontWeight: FontWeight.w500) ,

      ));




}