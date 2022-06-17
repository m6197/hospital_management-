import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../View/shared/components/components.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.GET(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Form(
                  key: cubit.formkeyForgetPass,
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/image/uppershape2.png',

                        ),
                      ),
                      SizedBox(height: 60.h,),
                      Text(
                        'Please enter your E-mail',
                        style: TextStyle(
                          color: Color.fromRGBO(1, 205, 170, 120),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                        child: defaultformfiled(
                            controller: cubit.emailcontroller_Forget,
                            label: '',
                            prefix: null,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Email';
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      defaultButton(
                          width: 160.w,
                          text: 'Next',
                          function: () {
                            if (cubit.formkeyForgetPass.currentState!
                                .validate()) {
                              print(cubit.emailcontroller_Forget.text);
                              cubit.forgetPass(
                                  cubit.emailcontroller_Forget.text, context);
                            }
                          }),
                      SizedBox(height: 60.h,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/image/down shape.png',
                        ),
                      ),
                    ]
                    ),
                ),
              ),
            ),
          );
        });
  }
}
