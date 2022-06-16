import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import 'package:nabdat/Model/UserModel.dart';
import 'package:nabdat/View/shared/components/components.dart';

class Reservations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.GET(context);
          return cubit.loadingDoctors
              ? Center(
                  child: CircularProgressIndicator(
                      color: Color.fromARGB(200, 1, 205, 170)),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
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
                            'Appointments',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 20),
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
                      cubit.getFirstReservation() == null
                          ? Center(
                              child: Text("You have no appointments today"),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.currentUser!.reservations.length,
                              itemBuilder: (context, index) {
                                if (cubit.currentUser!.reservations[index]
                                        .reservation_date ==
                                    cubit.date.toString().split(" ")[0]) {
                                  return appointment(
                                      context,
                                      cubit.currentUser!.reservations[index],
                                      cubit.getDoctorById(cubit.currentUser!
                                          .reservations[index].reserved_to),
                                      cubit);
                                } else {
                                  return Container();
                                }
                              },
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: Color.fromRGBO(1, 91, 76, 80),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      cubit.checkUpcoming() != true
                          ? Center(
                              child: Text("You have no upcoming appointments"),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.currentUser!.reservations.length,
                              itemBuilder: (context, index) {
                                if (cubit.currentUser!.reservations[index]
                                            .reservation_date !=
                                        cubit.date.toString().split(" ")[0] &&
                                    cubit.currentUser!.reservations[index]
                                            .status ==
                                        'upcoming') {
                                  return appointment(
                                      context,
                                      cubit.currentUser!.reservations[index],
                                      cubit.getDoctorById(cubit.currentUser!
                                          .reservations[index].reserved_to),
                                      cubit);
                                } else {
                                  return Container();
                                }
                              },
                            ),
                    ],
                  ),
                );
        });
  }
}

Widget appointment(
    context, Reservation? reservation, Doctor? doctor, MainCubit cubit) {
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
                          ? reservation!.type
                          : doctor.specialize + ' Specialis',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      AlertDialog alert = AlertDialog(
                        title: Center(child: Text("Cencle Appointment")),
                        content: Text(
                          "Do you want cancle appointment?",
                          textAlign: TextAlign.center,
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: TextButton(
                              child: Text("Yes"),
                              onPressed: () {
                                cubit.cancleBook(reservation!.id, context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: TextButton(
                              child: Text("No"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return cubit.canceling == true
                              ? CircularProgressIndicator()
                              : alert;
                        },
                      );
                    },
                    icon: Icon(Icons.close_rounded, color: Colors.white))
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
                      Row(
                        children: [
                          Icon(
                            Icons.price_change,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            reservation.price.floor().toString() + " LE",
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
