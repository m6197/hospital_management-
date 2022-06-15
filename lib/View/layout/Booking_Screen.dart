import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../shared/components/components.dart';

class BookingScreen extends StatelessWidget {
  final Doctor doctor;
  BookingScreen(this.doctor);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.GET(context);
          List availableTimes = cubit.availableDates(doctor);
          return Scaffold(
            body: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Column(children: [
                  Stack(children: [
                    Container(
                      width: double.infinity,
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(1, 205, 170, 70),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0.r),
                          bottomLeft: Radius.circular(20.0.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Booking',
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 90.h, left: 25.w, right: 25.w),
                      child: Container(
                        height: 240.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2.r,
                              blurRadius: 3.r,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1.0.r),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  top: 10.h,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 50.r,
                                      backgroundImage:
                                          NetworkImage(doctor.photo),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.h, left: 15.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dr. ' + doctor.name,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  200, 1, 91, 76),
                                            ),
                                          ),
                                          Text(
                                            doctor.specialize + ' Specialis',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Color.fromARGB(
                                                  200, 1, 91, 76),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/image/Path 52.png'),
                                              Text(
                                                '${doctor.rate ?? ''}',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      200, 1, 91, 76),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50.w,
                                              ),
                                              Text(
                                                '50 Reviews',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      200, 1, 91, 76),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 90.h,
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(1, 205, 170, 170),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Price',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(200, 1, 91, 76),
                                          ),
                                        ),
                                        Text(
                                          doctor.price.toString() + ' LE',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(200, 1, 91, 76),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 90.h,
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(1, 205, 170, 170),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Experiences',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(200, 1, 91, 76),
                                          ),
                                        ),
                                        Text(
                                          '10y+',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(200, 1, 91, 76),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 90.h,
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(1, 205, 170, 170),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Rateing',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(200, 1, 91, 76),
                                          ),
                                        ),
                                        Text(
                                          '${doctor.rate ?? 'Not Yet'}',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(200, 1, 91, 76),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Demograohy',
                        style: TextStyle(
                          color: Color.fromRGBO(1, 91, 76, 100),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Dr. Ahmed Mohamed is a specialist in dental medicine',
                    style: TextStyle(
                      color: Color.fromRGBO(1, 91, 76, 100),
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Schedules',
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ToggleSwitch(
                      minWidth: 90.0.w,
                      minHeight: 80.0.h,
                      fontSize: 16.0.sp,
                      initialLabelIndex: cubit.SelectedDoctorDateIndex,
                      activeBgColor: [
                        Color.fromRGBO(1, 91, 76, 100),
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.white,
                      totalSwitches: 4,
                      labels: List.generate(4, (index) {
                        return availableTimes[index][0].toString() +
                            " " +
                            availableTimes[index][1][1].toString();
                      }),
                      onToggle: (index) {
                        cubit.ChangeSelectedDoctorDateIndex(index);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose time',
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: availableTimes[cubit.SelectedDoctorDateIndex!][1][0]
                            .isEmpty
                        ? Center(
                            child: Text('No available times in selected day'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                cubit.getScheduleListRows(availableTimes),
                            itemBuilder: (context, item) {
                              return Center(
                                child: ToggleSwitch(
                                  minWidth: 90.0.w,
                                  minHeight: 55.0.h,
                                  fontSize: 16.0.sp,
                                  initialLabelIndex:
                                      cubit.timeRowSelectedIndex != item
                                          ? null
                                          : cubit.timeSelectedIndex,
                                  activeBgColor: [
                                    Color.fromRGBO(1, 91, 76, 100),
                                  ],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.white,
                                  totalSwitches: cubit.getScheduleTotalItems(
                                      availableTimes)[item],
                                  labels: List.generate(
                                      cubit.getScheduleTotalItems(
                                          availableTimes)[item],
                                      (index) => availableTimes[
                                              cubit.SelectedDoctorDateIndex!][1]
                                          [0][(item * 4) + index]),
                                  onToggle: (index) {
                                    print('switched to: $index');
                                    cubit.changeSelectedDate(index, item);
                                  },
                                ),
                              );
                            }),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: defaultButton(
                          width: 260.w,
                          text: 'Book Appointment',
                          function: () {}),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ]),
              ),
            ]),
          );
        });
  }
}
