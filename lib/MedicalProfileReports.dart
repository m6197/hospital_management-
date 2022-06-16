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
      ]),
    );
  }
}
