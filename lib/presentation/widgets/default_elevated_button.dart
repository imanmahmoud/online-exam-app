import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';

class DefaultElevatedButton extends StatelessWidget {
   const DefaultElevatedButton({super.key, required this.onPressed, required this.label,this.isValidate=true});

  final VoidCallback onPressed;
  final String label;
  final bool isValidate;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(backgroundColor:isValidate?ColorsManager.blueBase:ColorsManager.black30,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r)),
          padding:  EdgeInsets.symmetric(vertical: 14.h),
        ),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorsManager.white),
        ));
  }
}
