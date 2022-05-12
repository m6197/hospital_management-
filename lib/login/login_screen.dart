
import 'package:flutter/material.dart';
import 'package:gp/login/signup_screen.dart';

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

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey ,
              child: Column
                (
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Center(
                    child: Text(
                         'Welcome Back,',
                        style: TextStyle
                          (
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  Center(
                    child: Container(
                      width: 137,
                      child: const Center(
                        child: Text(
                          'Log in!',
                          style: TextStyle
                            (
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
  height: 40,
),
                  defaultformfiled(

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
                  const SizedBox(
                    height: 30,
                  ),
                  defaultformfiled(

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
                  Row(
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
                  const SizedBox
                    (
                    height: 40,
                  ),
                  Center(
                    child: defaultButton(

                      width: 470,
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
                    )
                  ),
const SizedBox(
  height: 55,
),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'if you don\'t have accoun',
                      ),
                      TextButton(onPressed: () {
                        Navigator.push(
                            this.context,
                            MaterialPageRoute(
                            builder: (context) => Auth()),
                        );

                      }, child: const Text('Sign Up Now',
                        style:  TextStyle(
                        decoration: TextDecoration.underline,
                          color: Color.fromRGBO(1, 205, 170,70),
                      ),
                      ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Color COLOR()
{
  return Color.fromRGBO(1, 205, 170,70);

}