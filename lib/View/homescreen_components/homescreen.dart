import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/View/layout/Analysis.dart';
import 'package:nabdat/View/layout/Radiolgy_Screen.dart';
import 'package:flutter/material.dart';
import '../../View/layout/Speciality_screen.dart';
import '../../View/layout/doctors_screen.dart';

class homescrren extends StatelessWidget {
  List titles = [
    {
      'title': "Doctors",
      'image': "assets/image/noun-doctor-987749.png",
      "route": Doctor_screen()
    },
    {
      "title": "Speciality",
      "image": "assets/image/noun-report-987711.png",
      "route": SpecialityScreen()
    },
    {
      "title": "Radiology",
      "image": "assets/image/noun-x-ray-4792268.png",
      "route": RadiolgyScreen()
    },
    {
      "title": "Analysis",
      "image": "assets/image/noun-test-tube-987718.png",
      "route": Analysis_screen()
    }
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.GET(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 25.sp,
                            ),
                          ),
                          Text(
                            cubit.currentUser!.name,
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: ImageIcon(AssetImage(
                            'assets/image/noun-profile-709597.png',
                          )),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) => buildStoryItem(
                        titles[index]['title'],
                        titles[index]['image'],
                        titles[index]['route'],
                        context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Appointment Today',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromRGBO(1, 205, 170, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: Colors.yellow[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(1, 205, 170, 90),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(
                                  'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: const [
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
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(1, 205, 170, 50),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
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
                                        width: 5,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Doctors',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromRGBO(1, 205, 170, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/image/Rectangle 52.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Ahmed Mohamed',
                                style: TextStyle(
                                  color: Color.fromRGBO(1, 205, 170, 50),
                                ),
                              ),
                              Text(
                                'Dental Specialis',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(1, 205, 170, 120),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/image/Path 52.png'),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: Color.fromRGBO(1, 205, 170, 50),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    '50 Reviews',
                                    style: TextStyle(
                                      color: Color.fromRGBO(1, 205, 170, 50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/image/Rectangle 52.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Ahmed Mohamed',
                                style: TextStyle(
                                  color: Color.fromRGBO(1, 205, 170, 50),
                                ),
                              ),
                              Text(
                                'Dental Specialis',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(1, 205, 170, 120),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/image/Path 52.png'),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: Color.fromRGBO(1, 205, 170, 50),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    '50 Reviews',
                                    style: TextStyle(
                                      color: Color.fromRGBO(1, 205, 170, 50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/image/Rectangle 52.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Ahmed Mohamed',
                                style: TextStyle(
                                  color: Color.fromRGBO(1, 205, 170, 50),
                                ),
                              ),
                              Text(
                                'Dental Specialis',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(1, 205, 170, 120),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/image/Path 52.png'),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: Color.fromRGBO(1, 205, 170, 50),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    '50 Reviews',
                                    style: TextStyle(
                                      color: Color.fromRGBO(1, 205, 170, 50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildStoryItem(String title, String image, var route, var context) =>
      Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(45.r),
              splashColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              ),
              child: CircleAvatar(
                radius: 45.r,
                backgroundColor: Color.fromRGBO(1, 205, 170, 190),
                child: Image(
                  height: 50.h,
                  width: 50.h,
                  image: AssetImage(
                    image,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 11.sp),
              maxLines: 1,
            ),
          ],
        ),
      );
}
