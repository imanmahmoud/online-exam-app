import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/theme_manager.dart';
import 'package:online_exam_app/presentation/screens/login/login_screen.dart';
import 'package:online_exam_app/presentation/screens/register/register_screen.dart';

class OnlineExamApp extends StatelessWidget {

  const OnlineExamApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:(context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Exam',
        theme: ThemeManager.mainTheme,
        routes: {
          LoginScreen.routeName :(_) => const LoginScreen(),
          RegisterScreen.routeName :(_) => const RegisterScreen(),
        },
        initialRoute:RegisterScreen.routeName,

      ) ,

    );
  }
}