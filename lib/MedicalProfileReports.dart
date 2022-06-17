import 'package:flutter/material.dart';

class MedicalProfileReports extends StatelessWidget {
  const MedicalProfileReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Color.fromRGBO(1, 205, 170, 70),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: Text(
              'Reports',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Prescription',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromRGBO(1, 91, 76,50),
                fontWeight: FontWeight.bold,
              ),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 190,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black,
                width: 0.7)
            ),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Report',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromRGBO(1, 91, 76,50),
                fontWeight: FontWeight.bold,
              ),),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(

            maxLines: 15,
            readOnly: true,
            decoration: InputDecoration(
              fillColor: Colors.white, filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),

          ),
        ),
      ]
      ),
    );
  }
}
