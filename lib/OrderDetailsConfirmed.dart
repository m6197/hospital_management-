import 'package:flutter/material.dart';

import 'View/shared/components/components.dart';



class OrderDetailsConfirmed extends StatelessWidget {
  var orderCode = 1200;

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
              'Settings',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Confirmed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(200, 1, 205, 170),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Your Order Code : ${orderCode}',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(200, 1, 205, 170),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: defaultButton(
                width: 240, text: 'Back to Home', function: () {}),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
