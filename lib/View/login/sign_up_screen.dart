import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';
import '../../View/shared/components/components.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var cubit = AuthCubit.GET(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Form(
                  key: cubit.formkey_Signup,
                    child: Column(

                      children: [
                        Stack(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/image/uppershape1.png',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 130.h,
                              left: 40.w,
                            ),
                            child: Text(
                              'Sign Up,',
                              style: TextStyle(
                                fontSize: 36.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]
                        ),
                    SizedBox(height: 13.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                        SizedBox(height: 10.h,),
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
                              controller: cubit.phonecontroller_Signup,
                              label: 'Phone',
                              prefix: Icons.email,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your Phone Number';
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
                          defaultButton(
                              width: 160.w,
                              isLoading: cubit.isLogging,
                              text: 'Sing up',
                              function: () {
                                if (cubit.formkey_Signup.currentState!
                                    .validate()) {
                                  cubit.Signup(context);
                                }
                                ;
                              }),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Text(
                              'or sign up with',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.facebook,
                                    color: Colors.blue,
                                    size: 33.r,
                                  ),
                                  onPressed: () {
                                    //statements
                                    print('IconButton is pressed');
                                  },
                                ),
                                SizedBox(
                                  width: 35.w,
                                ),
                                IconButton(
                                  icon: Image.asset(
                                    'assets/image/google-icon.png',
                                    width: 33.r,
                                    height: 33.r,
                                  ),
                                  iconSize: 33.r,
                                  onPressed: () {
                                    //statements
                                    print('IconButton is pressed');
                                  },
                                ),
                                SizedBox(
                                  width: 35.w,
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
                              ]
                          ),
                          ]
                      ),
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
            ),
          );
        });
  }
}
