import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';

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
                child: Form(
                  key: cubit.formkeyForgetPass,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Text(
                        'Please enter your E-mail',
                        style: TextStyle(
                          color: Color.fromRGBO(1, 205, 170, 120),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultformfiled(
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
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                          width: 160,
                          text: 'Next',
                          function: () {
                            if (cubit.formkeyForgetPass.currentState!
                                .validate()) {
                              print(cubit.emailcontroller_Forget.text);
                              cubit.forgetPass(
                                  cubit.emailcontroller_Forget.text, context);
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
