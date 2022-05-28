import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:course1/layout/Booking_Screen.dart';
import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class Doctor_screen extends StatefulWidget {

  @override
  State<Doctor_screen> createState() => _Doctor_screenState();
}

class _Doctor_screenState extends State<Doctor_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [

              Container(
                width:double.infinity,
                height: 150,
                decoration:  BoxDecoration(
                  color:  Color.fromRGBO(1, 205, 170,70),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),

                child: Center(
                  child: Text('Doctors',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //inverted selection button bar
                  AnimatedButtonBar(
                    backgroundColor: Color.fromRGBO(1, 205, 170 ,190),
                    foregroundColor: Color.fromRGBO(1, 205, 170 ,120),
                    radius: 25.0,
                    padding: const EdgeInsets.all(16.0),
                    invertedSelection: false,
                    children: [
                      ButtonBarEntry ( onTap: () => setState(() {
                      }),
                        child: Text('All',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ButtonBarEntry(onTap: () => setState(() {

                      }),
                          child: Text('Avaliable Today',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,

                            ),)),
                      ButtonBarEntry(onTap: () => print('Third item tapped'), child: Text('Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,


                        ),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,),
          child: TextField(
              onChanged: (value) {
                var x;
                x = x.where((i) => x.contains(value));
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(1, 205, 170,70),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(1, 205, 170,70),
                  ),
                ),
              ),
          ),
        ),
              Padding (
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50,top: 20,),
                            child: Image.asset(
                              'assets/image/Rectangle 52.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Ahmed Mohamed',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 205, 170, 50),
                                  ),
                                ),
                                Text(
                                  'Dental Specialis',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(1, 205, 170, 120),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/image/Path 52.png'),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      '50 Reviews',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      defaultButton(
                        width: 280,
                        text: 'Book Appointment',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding (
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50,top: 20,),
                            child: Image.asset(
                              'assets/image/Rectangle 52.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Ahmed Mohamed',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 205, 170, 50),
                                  ),
                                ),
                                Text(
                                  'Dental Specialis',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(1, 205, 170, 120),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/image/Path 52.png'),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      '50 Reviews',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      defaultButton(
                        width: 280,
                        text: 'Book Appointment',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding (
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50,top: 20,),
                            child: Image.asset(
                              'assets/image/Rectangle 52.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Ahmed Mohamed',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 205, 170, 50),
                                  ),
                                ),
                                Text(
                                  'Dental Specialis',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(1, 205, 170, 120),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/image/Path 52.png'),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      '50 Reviews',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      defaultButton(
                        width: 280,
                        text: 'Book Appointment',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding (
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50,top: 20,),
                            child: Image.asset(
                              'assets/image/Rectangle 52.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Ahmed Mohamed',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 205, 170, 50),
                                  ),
                                ),
                                Text(
                                  'Dental Specialis',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(1, 205, 170, 120),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/image/Path 52.png'),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      '50 Reviews',
                                      style: TextStyle(
                                        color: Color.fromRGBO(1, 205, 170, 50),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      defaultButton(
                        width: 280,
                        text: 'Book Appointment',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}