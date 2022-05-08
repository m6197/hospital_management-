
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/components/components.dart';

class loginScreen extends StatefulWidget {
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
                  Center(
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
                      child: Center(
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
                  SizedBox(
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
                  SizedBox(
                    height: 30,
                  ),
                  defaultformfiled(controller: passcontrol,
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
                      TextButton(onPressed: () {}, child: Text('Forgot password?'

                      ),

                      ),
                    ],
                  ),
                  SizedBox
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

                           }

                         }

                    ),
                  ),
SizedBox(
  height: 55,
),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'if you don\'t have accoun',
                      ),
                      TextButton(onPressed: () {}, child: Text('Sign Up Now',
                        style: TextStyle(
                        decoration: TextDecoration.underline,
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
