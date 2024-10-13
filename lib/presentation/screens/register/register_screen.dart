import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/presentation/screens/login/login_screen.dart';

import '../../../core/theming/colors_manager.dart';
import '../../../core/utils/validatorUtils.dart';
import '../../widgets/default_elevated_button.dart';
import '../../widgets/default_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName='register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool _isFormValid=true;
  final _formKey=GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _confirmPasswordController=TextEditingController();
  final _userNameController=TextEditingController();
  final _firstNameController=TextEditingController();
  final _lastNameController=TextEditingController();
  final _phoneNumberController=TextEditingController();


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
        appBar: AppBar(title: const Text('sign up'),),

        body:Padding(
          padding:  EdgeInsets.all(16.r),
          child: Form(
            key: _formKey,
            /*onChanged:_validateForm ,*/
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DefaultTextFormField(label: 'User name', hintText: 'Enter your user name', controller: _userNameController,
                    validator: (value) {
                      if(!ValidatorUtils.hasMinLength(value,minLength: 3)){
                        return "This user name is not valid";
                      }
                      return null;
                    },),
                  SizedBox(height: 24.h,),
                  Row(children: [
                    Expanded(
                      child: DefaultTextFormField(label: 'First Name', hintText: 'Enter first name', controller: _firstNameController,
                        validator: (value) {
                          if(!ValidatorUtils.hasMinLength(value,minLength: 3)){
                            return "name must be contain 3 characters at least";
                          }
                          return null;
                        },),
                    ),
                    SizedBox(width: 20.w,),
                    Expanded(
                      child: DefaultTextFormField(label: 'Last name', hintText: 'Enter last name', controller: _lastNameController,
                        validator: (value) {
                          if(!ValidatorUtils.hasMinLength(value,minLength: 3)){
                            return "name must be contain 3 characters at least";
                          }
                          return null;
                        },),
                    ),
                  ]),
                  SizedBox(height: 24.h,),

                  DefaultTextFormField(label: 'Email', hintText: 'Enter your email', controller: _emailController,
                    validator: (value) {
                      if(!ValidatorUtils.isEmail(value)){
                        return "This Email is not valid";
                      }
                      return null;
                    },),
                  SizedBox(height: 24.h,),
                  Row(children: [
                    Expanded(
                      child: DefaultTextFormField(label: 'Password', hintText: 'Enter password', controller: _passwordController,
                        validator: (value) {
                          if(!ValidatorUtils.isPassword(value)){
                            return "Password must be contain 6 characters at least";
                          }
                          return null;
                        },),
                    ),
                    SizedBox(width: 20.w,),
                    Expanded(
                      child: DefaultTextFormField(label: 'Confirm password', hintText: 'Confirm password', controller: _confirmPasswordController,
                        validator: (value) {
                            if(value != _passwordController.text){
                          return "Password not matched";
                        }
                        return null;
                        },),
                    ),
                  ]),
                  SizedBox(height: 24.h,),
                  DefaultTextFormField(label: 'Phone number', hintText: 'Enter phone number',keyBoard: TextInputType.phone, controller: _phoneNumberController,
                    validator: (value) {
                      if(!ValidatorUtils.hasMinLength(value,minLength: 11) || (value!=null && value.trim().length>11)){
                        return "phone number must be contain 11 number";
                      }
                      return null;
                    },),

                  SizedBox(height: 48.h,),
                  DefaultElevatedButton(onPressed: register,
                      label: 'Sign up',
                      isValidate: _isFormValid),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: const Text('Login',style: TextStyle(color: ColorsManager.blueBase,
                          decoration: TextDecoration.underline,
                        )),
                      ),

                    ],
                  )


                ],),
            ),
          ),
        ));
  }


  void register(){
    _validateForm();
  }

}