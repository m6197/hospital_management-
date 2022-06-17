import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../View/shared/components/components.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  var formkey = GlobalKey<FormState>();
  var namecontrol = TextEditingController();
  var emailcontrol = TextEditingController();
  var phonecontrol = TextEditingController();
  var datecontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 205, 170, 70),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(1, 205, 170, 70),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0.r),
                          bottomLeft: Radius.circular(20.0.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              "Personal Data",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/image/Ellipse 18.png',
                          height: 100,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 60,
                            left: 60,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/image/Group 60.png',
                            ),
                            onPressed: () {
                              //statements
                              print('IconButton is pressed');
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        defaultformfiled(
                            controller: namecontrol,
                            label: 'Your Name',
                            prefix: Icons.account_circle,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Username';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        defaultformfiled(
                            controller: datecontrol,
                            prefix: Icons.date_range,
                            label: 'Date of Birth',
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Username';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        defaultformfiled(
                            controller: emailcontrol,
                            prefix: Icons.email,
                            label: 'E-mail',
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Username';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        defaultformfiled(
                            controller: phonecontrol,
                            label: 'Phone Number',
                            prefix: Icons.phone,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Username';
                              }
                              return null;
                            }),
                      ]),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: defaultButton(
                            width: 160,
                            text: 'Save',
                            function: () {
                              if (formkey.currentState!.validate()) {
                                print(namecontrol.text);
                                print(datecontrol.text);
                                print(emailcontrol.text);
                                print(phonecontrol.text);
                              }
                              ;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
