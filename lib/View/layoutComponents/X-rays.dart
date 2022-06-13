
import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class Xrays extends StatelessWidget {
  const Xrays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
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
              child: Text('X-rays',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,
                top: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
              Text('Schedules',
                style: TextStyle(
                  color: Color.fromRGBO(1, 91, 76,80),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,
                top: 120),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
              Text('About Radiolgy',
                style: TextStyle(
                  color: Color.fromRGBO(1, 91, 76,80),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Text('Dr. Ahmed Mohamed is a specialist in dental medicine',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}
