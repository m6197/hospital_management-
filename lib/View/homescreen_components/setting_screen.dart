import 'package:flutter/material.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Shared/network/local/chache_helper.dart';

import '../../View/shared/components/components.dart';
import '../login/login_screen.dart';
import 'Personal Data.dart';

class setting extends StatelessWidget {
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
        height: 20,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PersonalData()),
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
                    Image.asset('assets/image/Ellipse 19.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Personal Data'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(200, 1, 91, 76),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/image/noun-language-1.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Languages'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(200, 1, 91, 76),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/image/noun-faq-135560.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('FAQs'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(200, 1, 91, 76),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/image/noun-community-.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Community'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(200, 1, 91, 76),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: defaultButton(
              width: 240,
              text: 'Log out',
              function: () {
                CacheHelper.removeData(key: "token");
                MainCubit.GET(context).currentIndex = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginScreen()),
                );
              }),
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ]);
  }
}
