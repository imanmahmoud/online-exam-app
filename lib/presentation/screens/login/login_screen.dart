import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';
import 'package:online_exam_app/core/utils/validatorUtils.dart';
import 'package:online_exam_app/presentation/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/widgets/default_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName='login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _rememberMe=false;
  bool _isFormValid=true;
  final _formKey=GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();


  void _validateForm(){
    if(_formKey.currentState!=null){
      setState(() {
        _isFormValid=_formKey.currentState!.validate();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('Login'),),

        body:Padding(
          padding:  EdgeInsets.all(16.r),
          child: Form(
            key: _formKey,
            /*onChanged:_validateForm ,*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              DefaultTextFormField(label: 'Email', hintText: 'Enter your email', controller: _emailController,
                  validator: (value) {
                if(!ValidatorUtils.isEmail(value)){
                  return "This Email is not valid";
                }
                return null;
                  },),
              SizedBox(height: 24.h,),
              DefaultTextFormField(label: 'Password', hintText: 'Enter your password', controller: _passwordController,
                  validator: (value) {
                if(!ValidatorUtils.isPassword(value)){
                  return "Password must be contain 6 characters at least";
                }
                return null;
                  },),
              Row(
                children: [
                  Checkbox(
                    activeColor: ColorsManager.blueBase,
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Remember me',),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // navigate to password screen
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(color: ColorsManager.blackBase,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h,),
              DefaultElevatedButton(onPressed: login,
                label: 'Login',
              isValidate: _isFormValid),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup screen
                      },
                      child: const Text('Sign up',style: TextStyle(color: ColorsManager.blueBase,
                        decoration: TextDecoration.underline,
                      )),
                    ),

                  ],
                )


            ],),
          ),
        ));
  }


void login(){
 _validateForm();
}

}
