import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';

import '../../View/shared/components/components.dart';

class NewPassForget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.GET(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formkeyNewPassForget,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      defaultformfiled(
                        controller: cubit.passcontrol_Forget1,
                        type: TextInputType.emailAddress,
                        isPassword: cubit.ispassword1_Forget,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password ';
                          }
                          return null;
                        },
                        label: 'New Password',
                        prefix: Icons.lock,
                        suffix: cubit.ispassword1_Forget
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixpressed: () {
                          cubit.Forget2PassShowChange();
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      defaultformfiled(
                        controller: cubit.passcontrol_Forget2,
                        type: TextInputType.emailAddress,
                        isPassword: cubit.ispassword2_Forget,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password ';
                          } else if (cubit.passcontrol_Forget1.text != value) {
                            return 'Password doesn\'t match';
                          }
                          return null;
                        },
                        label: 'Confirm Password',
                        prefix: Icons.lock,
                        suffix: cubit.ispassword2_Forget
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixpressed: () {
                          cubit.Forget2PassShowChange();
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      defaultButton(
                          width: 160,
                          text: 'Next',
                          isLoading: cubit.reset,
                          function: () {
                            if (cubit.formkeyNewPassForget.currentState!
                                .validate()) {
                              print(cubit.emailcontroller_Forget.text);
                              cubit.resetPassword(context);
                            }
                          }),
                    ]),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
