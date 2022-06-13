import 'package:flutter/material.dart';

import '../../View/shared/components/components.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

var emailcontrol = TextEditingController();
var formkey = GlobalKey<FormState>();

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  'Please enter your E-mail or Phone number',
                  style: TextStyle(
                    color: Color.fromRGBO(1, 205, 170, 120),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultformfiled(
                    controller: emailcontrol,
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
                    text: 'Check',
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailcontrol.text);
                      }
                      ;
                    }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
