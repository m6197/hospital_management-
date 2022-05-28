

import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';

class RadiolgyScreen extends StatefulWidget {


  @override
  State<RadiolgyScreen> createState() => _RadiolgyScreenState();
}

class _RadiolgyScreenState extends State<RadiolgyScreen> {
  bool showContainer=false;
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
              child: Text('Radiolgy',
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
                  ButtonBarEntry ( onTap: () => print('first item tapped'),
                    child: Text('All',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ButtonBarEntry(onTap: () => print('Third item tapped'),
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
             padding: const EdgeInsets.all(8.0),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(115, 50),
                      maximumSize: const Size(115, 50),
                      primary: Color.fromRGBO(1, 205, 170 ,120),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text("X-rays"),
                    onPressed: (){},
                  ),
                  SizedBox(width: 13,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(115, 50),
                      maximumSize: const Size(115, 50),
                      primary: Color.fromRGBO(1, 205, 170 ,120),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text("  X-rays with \n        dye"),


                    onPressed: (){},
                  ),
                  SizedBox(width: 13,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(115, 50),
                      maximumSize: const Size(115, 50),
                      primary: Color.fromRGBO(1, 205, 170 ,120),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text("Ultrasound",

                    ),
                    onPressed: (){},
                  ),
                ],
              ),
           ),
        ],
      ),
    );
  }
}
