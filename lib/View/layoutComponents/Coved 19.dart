import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Model/AnalysisModel.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../shared/components/components.dart';

class CovedScreen extends StatelessWidget {
  final Analysis analysis;
  CovedScreen(this.analysis);
  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: EdgeInsets.only(left: 25.w, top: 15.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Schedules',
                    style: TextStyle(
                      color: Color.fromRGBO(1, 91, 76, 80),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ToggleSwitch(
                  minWidth: 90.0.w,
                  minHeight: 80.0.h,
                  fontSize: 16.0.sp,
                  initialLabelIndex: 0,
                  activeBgColor: [
                    Color.fromRGBO(1, 91, 76, 100),
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  totalSwitches: 4,
                  labels: ['Mon 11', 'Thu 12', 'Wed 13', 'Thr 14'],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),
              SizedBox(
                height: 30,
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
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ToggleSwitch(
                  minWidth: 90.0.w,
                  minHeight: 55.0.h,
                  fontSize: 16.0.sp,
                  initialLabelIndex: 0,
                  activeBgColor: [
                    Color.fromRGBO(1, 91, 76, 100),
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  totalSwitches: 3,
                  labels: [
                    '09:00 AM',
                    '10:00 AM',
                    '11:00 AM',
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
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
              analysis.description.isEmpty || analysis.description[0] == ''
                  ? Center(child: Text("There is no description"))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: analysis.description.length,
                      itemBuilder: (context, item) {
                        return Padding(
                          padding: EdgeInsets.only(left: 30.w, bottom: 10.h),
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
              analysis.instructions.isEmpty || analysis.instructions[0] == ''
                  ? Center(child: Text("There is no instructions"))
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: analysis.instructions.length,
                      itemBuilder: (context, item) {
                        return Padding(
                          padding: EdgeInsets.only(left: 30.w, bottom: 10.h),
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
                    width: 260.w, text: 'Book Appointment', function: () {}),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ));
  }
}
