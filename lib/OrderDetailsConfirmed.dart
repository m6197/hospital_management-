import 'package:flutter/material.dart';
import 'package:nabdat/View/layout/navscrren.dart';

import 'View/shared/components/components.dart';

class OrderDetailsConfirmed extends StatelessWidget {
  final orderCode;
  OrderDetailsConfirmed(this.orderCode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 205, 170, 70),
        toolbarHeight: 0,
        elevation: 0,
      ),
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
              'Success',
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
                  'Booking Confirmed',
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
                width: 240,
                text: 'Back to Home',
                function: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => navscreen()),
                      (route) => false);
                }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
