import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Model/AnalysisModel.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../shared/components/components.dart';

class CovedScreen extends StatelessWidget {
  final Analysis analysis;
  CovedScreen(this.analysis);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.GET(context);
          List availableTimes = cubit.availableDates(cubit.doctors[23]);

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(1, 205, 170, 70),
                toolbarHeight: 0,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(1, 205, 170, 70),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0.r),
                          bottomLeft: Radius.circular(20.0.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                cubit.timeSelectedIndex = null;
                                cubit.SelectedDoctorDateIndex = 0;
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              analysis.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
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
                          cubit.setSelectedDate(availableTimes[index!][0]);
                          cubit.selectedTime = "";
                          cubit.timeSelectedIndex = null;
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
                      child: availableTimes[cubit.SelectedDoctorDateIndex!][1]
                                  [0]
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
                                                cubit.SelectedDoctorDateIndex!]
                                            [1][0][(item * 4) + index]),
                                    onToggle: (index) {
                                      print('switched to: $index');
                                      cubit.changeSelectedDate(index, item);
                                      cubit.setSelectedTime(availableTimes[
                                              cubit.SelectedDoctorDateIndex!][1]
                                          [0][(item * 4) + index!]);
                                    },
                                  ),
                                );
                              }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 90.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'About Analysis',
                          style: TextStyle(
                            color: Color.fromRGBO(1, 91, 76, 80),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    analysis.description.isEmpty ||
                            analysis.description[0] == ''
                        ? Center(child: Text("There is no description"))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: analysis.description.length,
                            itemBuilder: (context, item) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: 30.w, bottom: 10.h),
                                child: Text(
                                  "• " + analysis.description[item],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }),
                    Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 10.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Analysis Instructions',
                          style: TextStyle(
                            color: Color.fromRGBO(1, 91, 76, 80),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    analysis.instructions.isEmpty ||
                            analysis.instructions[0] == ''
                        ? Center(child: Text("There is no instructions"))
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: analysis.instructions.length,
                            itemBuilder: (context, item) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: 30.w, bottom: 10.h),
                                child: Text(
                                  "• " + analysis.instructions[item],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: defaultButton(
                          width: 260.w,
                          isLoading: cubit.Booking,
                          text: 'Book Appointment',
                          function: () {
                            Doctor doc = cubit.doctors[23];
                            doc.price = analysis.price;
                            doc.specialize = analysis.name;
                            cubit.BookAppointment(doc, context);
                            doc.name = "Analysis Center";
                          }),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ));
        });
  }
}
