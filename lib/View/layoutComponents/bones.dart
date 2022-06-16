import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import '../layout/Booking_Screen.dart';
import '../shared/components/components.dart';

class BonesScreen extends StatelessWidget {
  final String speciality;

  BonesScreen(this.speciality);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 205, 170, 70),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
                Center(
                  child: Text(
                    speciality,
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
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //inverted selection button bar
              AnimatedButtonBar(
                backgroundColor: Color.fromRGBO(1, 205, 170, 190),
                foregroundColor: Color.fromRGBO(1, 205, 170, 120),
                radius: 25.0,
                padding: const EdgeInsets.all(16.0),
                invertedSelection: false,
                children: [
                  ButtonBarEntry(
                    onTap: () {},
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ButtonBarEntry(
                      onTap: () {},
                      child: Text(
                        'Avaliable Today',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  ButtonBarEntry(
                    onTap: () => print('Third item tapped'),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              onChanged: (value) {
                var x;
                x = x.where((i) => x.contains(value));
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(1, 205, 170, 70),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(1, 205, 170, 70),
                  ),
                ),
              ),
            ),
          ),
          allDoctors(MainCubit.GET(context).doctors)
        ]),
      ),
    );
  }

  Widget doctor(context, Doctor doctorModel) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        height: 160,
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
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                    top: 20,
                  ),
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: NetworkImage(doctorModel.photo),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr ' + doctorModel.name,
                        style: TextStyle(
                          color: Color.fromARGB(200, 1, 91, 76),
                        ),
                      ),
                      Text(
                        doctorModel.specialize + ' Specialist',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(200, 1, 91, 76),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/image/Path 52.png'),
                          Text(
                            '${doctorModel.rate == null ? '' : doctorModel.rate}',
                            style: TextStyle(
                              color: Color.fromARGB(200, 1, 91, 76),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            '50 Reviews',
                            style: TextStyle(
                              color: Color.fromARGB(200, 1, 91, 76),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            defaultButton(
              width: 280,
              text: 'Book Appointment',
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookingScreen(doctorModel)),
                ).then((value) {
                  MainCubit.GET(context).timeSelectedIndex = null;
                  MainCubit.GET(context).SelectedDoctorDateIndex = 0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget allDoctors(List<Doctor> doctors) {
    return ListView.builder(
      itemCount: doctors.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return doctors[index].specialize != speciality
            ? Container()
            : doctor(context, doctors[index]);
      },
    );
  }
}
