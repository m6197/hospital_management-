import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/View//layoutComponents/bones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialityScreen extends StatefulWidget {
  @override
  State<SpecialityScreen> createState() => _SpecialityScreenState();
}

class _SpecialityScreenState extends State<SpecialityScreen> {
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
                    'Speciality',
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
            height: 20.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //inverted selection button bar
              AnimatedButtonBar(
                backgroundColor: Color.fromRGBO(1, 205, 170, 190),
                foregroundColor: Color.fromRGBO(1, 205, 170, 120),
                radius: 25.0.r,
                padding: EdgeInsets.all(16.0),
                invertedSelection: false,
                children: [
                  ButtonBarEntry(
                    onTap: () => () {},
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ButtonBarEntry(
                      onTap: () => setState(() {}),
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
              Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: (6 / 2).h,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 20),
                      itemCount: MainCubit.GET(context).specialize.length,
                      itemBuilder: (context, index) {
                        return SpecialityCard(
                            MainCubit.GET(context).specialize[index]);
                      })),
            ],
          ),
        ]),
      ),
    );
  }

  Widget SpecialityCard(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(105, 50),
        maximumSize: Size(110, 50),
        primary: Color.fromRGBO(1, 205, 170, 120),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0.r),
        ),
      ),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
      )),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BonesScreen(text)),
      ),
    );
  }
}
