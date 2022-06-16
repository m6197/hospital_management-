import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import 'package:nabdat/Model/UserModel.dart';
import 'package:nabdat/View/layout/Analysis.dart';
import 'package:nabdat/View/layout/Booking_Screen.dart';
import 'package:nabdat/View/layout/Radiolgy_Screen.dart';
import 'package:flutter/material.dart';
import '../../View/layout/Speciality_screen.dart';
import '../../View/layout/doctors_screen.dart';

class homescrren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.GET(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              cubit.currentUser != null
                                  ? cubit.currentUser!.name
                                  : '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.sp,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                            image: AssetImage(
                              'assets/image/noun-profile-709597.png',
                            ),
                            height: 55.r,
                            width: 55.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.w, left: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cardBuilder(
                                "Doctors",
                                'assets/image/noun-doctor-987749.png',
                                Doctor_screen(),
                                context),
                            cardBuilder(
                                "Speciality",
                                'assets/image/noun-report-987711.png',
                                SpecialityScreen(),
                                context),
                            cardBuilder(
                                "Analysis",
                                'assets/image/noun-test-tube-987718.png',
                                Analysis_screen(),
                                context),
                            cardBuilder(
                                "Radiolgy",
                                'assets/image/noun-x-ray-4792268.png',
                                RadiolgyScreen(),
                                context),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.0.r),
                              child: Text(
                                'Appointment Today',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp,
                                    color: Color.fromARGB(200, 1, 91, 76)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
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
                    ],
                  ),
                  cubit.loadingDoctors
                      ? Center(
                          child: CircularProgressIndicator(
                              color: Color.fromARGB(200, 1, 205, 170)),
                        )
                      : cubit.getFirstReservation() == null
                          ? Center(
                              child: Text("You have no appointments today"),
                            )
                          : appointment(
                              context,
                              cubit.getFirstReservation(),
                              cubit.getDoctorById(
                                  cubit.getFirstReservation()!.reserved_to)),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 10.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Top Doctors',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: Color.fromARGB(200, 1, 91, 76),
                        ),
                      ),
                    ),
                  ),
                  cubit.loadingDoctors
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Color.fromARGB(200, 1, 205, 170),
                        ))
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.doctors.length,
                          itemBuilder: (context, index) {
                            return cubit.doctors[index].rate != null &&
                                    cubit.doctors[index].rate! >= 4.5
                                ? doctor(context, cubit.doctors[index])
                                : Container();
                          },
                        )
                ],
              ),
            ),
          );
        });
  }

  Widget cardBuilder(String title, String photo, var route, context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(22.r),
              splashColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.r),
                  color: Color.fromRGBO(1, 205, 170, 190),
                ),
                child: Image(
                  image: AssetImage(
                    photo,
                  ),
                  height: 72.w,
                  width: 72.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 10.0.h,
                end: 3.0.w,
              ),
            ),
          ],
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
    );
  }

  Widget appointment(context, Reservation? reservation, Doctor? doctor) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Container(
          height: 120.h,
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
                    width: 20.w,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25.0.r,
                    backgroundImage: NetworkImage(doctor!.photo),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    children: [
                      Text(
                        doctor.name == 'Radiology Center' ||
                                doctor.name == 'Analysis Center'
                            ? doctor.name
                            : "Dr " + doctor.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        doctor.name == 'Radiology Center' ||
                                doctor.name == 'Analysis Center'
                            ? "Hospital " + doctor.name
                            : doctor.specialize + ' Specialis',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
                child: Container(
                  height: 40.h,
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
                              MainCubit.GET(context).changeDateFormat(
                                  reservation!.reservation_date),
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
                              MainCubit.GET(context).AmPm(MainCubit.GET(context)
                                      .changeTimeFormat(
                                          reservation.reservation_time)
                                      .split("-")[0]) +
                                  "-" +
                                  MainCubit.GET(context).AmPm(
                                      MainCubit.GET(context)
                                          .changeTimeFormat(
                                              reservation.reservation_time)
                                          .split("-")[1]),
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
    );
  }

  Widget doctor(context, Doctor doctor) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 10.h),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingScreen(doctor)),
          ).then((value) {
            MainCubit.GET(context).timeSelectedIndex = null;
            MainCubit.GET(context).SelectedDoctorDateIndex = 0;
          });
        },
        borderRadius: BorderRadius.circular(15.3.r),
        child: Container(
          height: 115.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.3.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2.r,
                blurRadius: 3.r,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: NetworkImage(doctor.photo),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 31.h, left: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. ' + doctor.name,
                      style: TextStyle(
                        color: Color.fromARGB(200, 1, 91, 76),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      doctor.specialize + ' Specialis',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color.fromARGB(200, 1, 91, 76),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/image/Path 52.png'),
                        Text(
                          '${doctor.rate}',
                          style: TextStyle(
                            color: Color.fromARGB(200, 1, 91, 76),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Text(
                          '50 Reviews',
                          style: TextStyle(
                            color: Color.fromARGB(200, 1, 91, 76),
                            fontWeight: FontWeight.bold,
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
    );
  }
}
