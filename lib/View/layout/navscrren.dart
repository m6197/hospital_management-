import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/View/homescreen_components/profile_screen.dart';
import 'package:nabdat/View/homescreen_components/reservations.dart';
import 'package:flutter/material.dart';
import '../homescreen_components/homescreen.dart';
import '../homescreen_components/setting_screen.dart';

class navscreen extends StatelessWidget {
  List<Widget> screens = [
    homescrren(),
    Reservations(),
    MedicalProfile(),
    setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(1, 205, 170, 70),
              toolbarHeight: 0,
              elevation: 0,
            ),
            body: MainCubit.GET(context).loadingUserData == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(1, 205, 170, 50),
                    ),
                  )
                : screens[MainCubit.GET(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 30.r,
              selectedItemColor: Color.fromARGB(200, 1, 91, 76),
              unselectedItemColor: Color.fromARGB(100, 1, 91, 76),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: MainCubit.GET(context).currentIndex,
              onTap: (index) {
                MainCubit.GET(context).changeNavIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 35,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sticky_note_2_outlined,
                    size: 35,
                  ),
                  label: 'Reservations',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_outlined,
                    size: 35,
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 35,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          );
        });
  }
}
