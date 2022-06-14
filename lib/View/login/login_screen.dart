import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/View/login/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../Controller/AuthCubit/states.dart';
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
              physics: const NeverScrollableScrollPhysics(),
              child: Form(
                key: cubit.formkey_Login,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/image/upper shape.png',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 130.h,
                          left: 30.w,
                        ),
                        child: Text(
                          'Welcome Back,',
                          style: TextStyle(
                            fontSize: 35.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 170.h,
                          left: 30.w,
                        ),
                        child: Text(
                          'Log In!',
                          style: TextStyle(
                            fontSize: 47.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
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
                                    builder: (context) =>
                                        const ForgetPassword()),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color.fromRGBO(1, 205, 170, 100),
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: defaultButton(
                              width: 160.w,
                              isLoading: cubit.isLogging,
                              text: 'Log in',
                              function: () {
                                if (cubit.formkey_Login.currentState!
                                    .validate()) {
                                  cubit.Login(context);
                                }
                                ;
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/image/down shape.png',
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
