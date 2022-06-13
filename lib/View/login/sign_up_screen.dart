import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';
import '../../View/layout/navscrren.dart';
import '../../View/shared/components/components.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white));
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var cubit = AuthCubit.GET(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                child: Form(
                  key: cubit.formkey_Signup,
                  child: Padding(
                    padding: EdgeInsets.all(20.0.r),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: Text(
                            'Hello,',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                        Text(
                          'Sign Up!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        defaultformfiled(
                            controller: cubit.Usercontrol_Signup,
                            label: 'Username',
                            prefix: Icons.account_circle,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Username';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15.h,
                        ),
                        defaultformfiled(
                            controller: cubit.emailcontrol_Signup,
                            label: 'Email',
                            prefix: Icons.email,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Email';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15.h,
                        ),
                        defaultformfiled(
                          controller: cubit.passcontrol_Signup,
                          type: TextInputType.emailAddress,
                          isPassword: cubit.ispassword_Signup,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your Password ';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: cubit.ispassword_Signup
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixpressed: () {
                            cubit.SignupPassShowChange();
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        defaultformfiled(
                            controller: cubit.phonecontroller_Signup,
                            label: 'Phone',
                            prefix: Icons.call,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Phone Number';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 25.h,
                        ),
                        cubit.isLogging == true
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: Color.fromRGBO(1, 205, 170, 100)),
                              )
                            : defaultButton(
                                width: 160.w,
                                text: 'Sign up',
                                function: () {
                                  if (cubit.formkey_Signup.currentState!
                                      .validate()) {
                                    print(cubit.Usercontrol_Signup.text);
                                    print(cubit.emailcontrol_Signup.text);
                                    print(cubit.passcontrol_Signup.text);
                                    cubit.Signup(context);
                                  }
                                  ;
                                }),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Text(
                            'or sign up with',
                            style: TextStyle(
                              fontSize: 16.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                  size: 36.r,
                                ),
                                onPressed: () {
                                  //statements
                                  print('IconButton is pressed');
                                },
                              ),
                              SizedBox(
                                width: 35.h,
                              ),
                              IconButton(
                                icon: Image.asset(
                                  'assets/image/google-icon.png',
                                  height: 33.r,
                                  width: 33.r,
                                ),
                                onPressed: () {
                                  //statements
                                  print('IconButton is pressed');
                                },
                              ),
                              SizedBox(
                                width: 35.h,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.apple,
                                  size: 33.r,
                                ),
                                onPressed: () {
                                  //statements
                                  print('IconButton is pressed');
                                },
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
