import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
              children: [CircularProgressIndicator(),
                SizedBox(width: 12.w),
                Text(message,)]),
        );
      },
    );
  }

  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context,String message,
      { String title = "" ,
        String? posActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool isDismissible=false
      }){
    List<Widget> actions=[];
    if(posActionName != null){
      actions.add(TextButton(onPressed: () {
        Navigator.pop(context);
        posAction?.call();
      },
          child: Text(posActionName)));
    }
    if(negActionName != null){
      actions.add(TextButton(onPressed: () {
        Navigator.pop(context);
        negAction?.call();
      },
          child: Text(negActionName)));
    }

    showDialog(
      barrierDismissible: isDismissible,
      context: context, builder: (context) {
      return AlertDialog(
        title:Text(title) ,
        content: Text(message,style: const TextStyle(fontWeight: FontWeight.w400),),
        actions: actions,

      );
    },);
  }
}
