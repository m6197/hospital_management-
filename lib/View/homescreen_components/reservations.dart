import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/View/shared/components/components.dart';

class Reservations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 205, 170, 70),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 205, 170, 70),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0.r),
                bottomLeft: Radius.circular(20.0).r,
              ),
            ),
            child: Center(
              child: Text(
                'Reservations',
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today',
                style: TextStyle(
                  color: Color.fromRGBO(1, 91, 76, 80),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          appointment(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sunday',
                style: TextStyle(
                  color: Color.fromRGBO(1, 91, 76, 100),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          appointment(),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

Widget appointment() {
  return Padding(
    padding: EdgeInsets.all(15.0.r),
    child: Container(
      padding: EdgeInsets.all(10.r),
      height: 125.h,
      decoration: BoxDecoration(
        color: Color.fromARGB(200, 1, 205, 170),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                radius: 25.0.r,
                backgroundImage: NetworkImage(
                    'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                children: [
                  Text(
                    'Dr.Salma Emad',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Dentel Specialis',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Price 50 L.E',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  color: Color.fromARGB(200, 1, 91, 76),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
            child: Container(
              height: 35.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(120, 2, 143, 119),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Monday,May 5',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '11:00AM-12:00AM',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
