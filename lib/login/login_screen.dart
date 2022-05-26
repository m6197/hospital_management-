
import 'package:flutter/material.dart';

import '../layout/navscrren.dart';
import '../shared/components/components.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}
class _loginScreenState extends State<loginScreen> {
  var emailcontrol = TextEditingController();
  var passcontrol = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (

      body:  SingleChildScrollView(
        child: Form(
          key: formkey ,
          child: Column
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [

              Align(
                alignment: Alignment.topRight,
                child: Image.asset(

                  'assets/image/upper shape.png',

                ),
              ),






              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: defaultformfiled(

                    controller: emailcontrol,
                    label: 'Email or Phone',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Email';
                      }
                      return null;
                    }

                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: defaultformfiled(

                  controller: passcontrol,
                  type: TextInputType.emailAddress,
                  isPassword: ispassword,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Password ';
                    }
                    return null;
                  },
                  label: 'password', prefix: Icons.lock,
                  suffix: ispassword ? Icons.visibility : Icons.visibility_off,

                  suffixpressed: () {
                    setState(() {
                      ispassword = !ispassword;
                    });
                  },

                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Forgot password?',
                      style: TextStyle(
                        color: Color.fromRGBO(1, 205, 170,100),
                        fontSize: 12,
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox
                (
                height: 20,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/image/down shape.png'),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultButton(
                      width: 160,
                      text: 'Log in',
                      function: () {
                        if (formkey.currentState!.validate()) {
                          print(emailcontrol.text);
                          print(passcontrol.text);
                          Navigator.push(
                            this.context,
                            MaterialPageRoute(
                                builder: (context) => navscreen()),
                          );
                        };
                      },

                    ),
                  ),

                  const SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 140,horizontal: 35),
                    child: Row(
                      children: [
                        const Text(
                          'if you don\'t have account',
                        ),
                        TextButton(onPressed: () {}, child: const Text('Sign Up Now',
                          style:  TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(1, 205, 170,70),
                          ),
                        ),
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
