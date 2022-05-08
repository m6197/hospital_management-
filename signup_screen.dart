import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';



class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6.8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "it's easier to sign up now ",
                    style: TextStyle(fontSize: 16.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 86.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff3A579B)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage('images/facebook.png'),
                            height: 6.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "  Continue with Facebook",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 70.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent),
                    child: Center(
                      child: Text(
                        "i'll use phone number ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 6.w,
                        child: const Image(
                          image: AssetImage('images/apple.png'),
                        ),

                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 5.w,
                        child: const Image(
                          image: AssetImage('images/google.png'),
                        ),

                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 16.sp, color: Colors.teal),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'login',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
