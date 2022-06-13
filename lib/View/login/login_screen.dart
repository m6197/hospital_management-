import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/View/login/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../Controller/AuthCubit/states.dart';
import '../../View/layout/navscrren.dart';
import '../../View/shared/components/components.dart';
import 'forget_password.dart';

class loginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 1, 205, 171)));
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var cubit = AuthCubit.GET(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics:
                  ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/image/upper shape.png',
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: defaultformfiled(
                          controller: cubit.emailcontrol_Login,
                          label: 'Email',
                          prefix: Icons.email,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your Email';
                            }
                            return null;
                          }),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: defaultformfiled(
                        controller: cubit.passcontrol_Login,
                        type: TextInputType.emailAddress,
                        isPassword: cubit.ispassword_Login,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password ';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: cubit.ispassword_Login
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixpressed: () {
                          cubit.LoginPassShowChange();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()),
                              );
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color.fromRGBO(1, 205, 170, 100),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: cubit.isLogging == true
                          ? Container(
                              width: 160.w,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                  color: Color.fromRGBO(1, 205, 170, 70)),
                            )
                          : defaultButton(
                              width: 160.w,
                              text: 'Log in',
                              function: () {
                                if (formkey.currentState!.validate()) {
                                  print(cubit.emailcontrol_Login.text);
                                  print(cubit.passcontrol_Login.text);
                                  cubit.Login(context);
                                }
                                ;
                              }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 100.h,
                        left: 20.w,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'If you don\'t have account',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            },
                            child: const Text(
                              'Sign Up Now',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(1, 205, 170, 70),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
