import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/components/components.dart';
class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: Column(
        children: [

        Stack(

          children: [ Container(
          width:double.infinity,
          height: 187,
          decoration:  BoxDecoration(
            color:  Color.fromRGBO(1, 205, 170,70),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),

          child: Center(
            child: Text('Booking',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ),
            Padding (
              padding: const EdgeInsets.only(top:130,
              left: 25,
              right: 25),
              child: Container(
                height: 220,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,
                          vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color:Color.fromRGBO(1, 205, 170, 170),
                              shape: BoxShape.circle,
                            ),
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Patients',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 91, 76,100),
                                  ),
                                ),
                                Text('100+',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 91, 76,100),
                                  ),
                                )
                              ],
                            ),

                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color:Color.fromRGBO(1, 205, 170, 170),
                              shape: BoxShape.circle,
                            ),
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Experiences',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 91, 76,100),
                                  ),
                                ),
                                Text('10y+',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 91, 76,100),
                                  ),
                                )
                              ],
                            ),

                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color:Color.fromRGBO(1, 205, 170, 170),
                              shape: BoxShape.circle,
                            ),
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Rateing',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 91, 76,100),
                                  ),
                                ),
                                Text('4.5',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 91, 76,100),
                                  ),
                                )
                              ],
                            ),

                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
      ]
        ),
    SizedBox(height: 15,),
    Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Align(
      alignment: Alignment.centerLeft,
      child:
            Text('Demograohy',
              style: TextStyle(
                color: Color.fromRGBO(1, 91, 76,100),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    ),
             SizedBox(height: 15,),
          Text('Dr. Ahmed Mohamed is a specialist in dental medicine',
            style: TextStyle(
              color: Color.fromRGBO(1, 91, 76,100),
            ),
          ),


          SizedBox(height: 90,),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
              Text('Schedules',
                style: TextStyle(
                  color: Color.fromRGBO(1, 91, 76,100),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 90,),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
              Text('Choose time',
                style: TextStyle(
                  color: Color.fromRGBO(1, 91, 76,100),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
              defaultButton(
                  width: 260,
                  text: 'Book Appointment',
                  function: () {
                  }
              ),
            ),
          ),
          SizedBox(height: 15,),
      ]
    ),
    );
  }
}
