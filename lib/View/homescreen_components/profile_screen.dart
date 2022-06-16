import 'package:flutter/material.dart';
import 'package:nabdat/MedicalProfileAnalysis.dart';
import 'package:nabdat/MedicalProfileRadiolgy.dart';
import 'package:nabdat/MedicalProfileReports.dart';

class MedicalProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
            'Medical Profile',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicalProfileReports()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image/noun-report-987711.png',
                      width: 55,
                      height: 55,
                      color: Color.fromRGBO(1, 205, 170, 90),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Reports'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(1, 205, 170, 90),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicalProfileAnalysis()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image/noun-test-tube-987718.png',
                      width: 55,
                      height: 55,
                      color: Color.fromRGBO(1, 205, 170, 90),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Analysis'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(1, 205, 170, 90),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicalProfileRadiolgy()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image/noun-x-ray-4792268.png',
                      width: 55,
                      height: 55,
                      color: Color.fromRGBO(1, 205, 170, 90),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Radiolgy'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(1, 205, 170, 90),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
