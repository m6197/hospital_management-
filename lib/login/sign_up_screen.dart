import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../layout/navscrren.dart';
import '../../shared/components/components.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var Usercontrol = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var emailcontrol = TextEditingController();
  var passcontrol = TextEditingController();
  bool ispassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body :Center(
   child: SingleChildScrollView(
     child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        'Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  Text('Sign Up!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                   SizedBox(height: 60,),
                   defaultformfiled(
                      controller: Usercontrol,
                      label: 'Username',
                       prefix: Icons.account_circle,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your Username';
                        }
                        return null;
                      }
                      ),

SizedBox(height: 15,),
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
                  }),

                  SizedBox(height: 15,),
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
                      label: 'Password',
                      prefix: Icons.lock,
                      suffix: ispassword ? Icons.visibility : Icons.visibility_off,
                      suffixpressed: () {
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                    ),
                  SizedBox(height: 25,),

                   defaultButton(
                        width: 160,
                        text: 'Sing up',
                        function: () {
                          if (formkey.currentState!.validate()) {
                            print(Usercontrol.text);
                            print(emailcontrol.text);
                            print(passcontrol.text);
                            Navigator.push(
                              this.context,
                              MaterialPageRoute(builder: (context) => navscreen()),
                            );
                          };
                        }
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                        'or sign up with',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                   IconButton(
                         icon: Icon(
                           Icons.facebook,
                           color: Colors.blue,
                           size: 33,
                         ),
                         onPressed: () {
                           //statements
                           print('IconButton is pressed');
                         },
                       ),
                       SizedBox(width: 35,),
                       IconButton(
                         icon: Image.asset('assets/image/google-icon.png',

                         ),
                         onPressed: () {
                           //statements
                           print('IconButton is pressed');
                         },
                       ),
                       SizedBox(width: 35,),
                       IconButton(
                         icon: Icon(
                           Icons.apple,

                           size: 33,
                         ),
                         onPressed: () {
                           //statements
                           print('IconButton is pressed');
                         },
                       ),


        ]
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
