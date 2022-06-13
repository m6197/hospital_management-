import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/View/layout/profile_screen.dart';
import 'package:flutter/material.dart';
import '../homescreen_components/homescreen.dart';
import '../homescreen_components/setting_screen.dart';

class navscreen extends StatelessWidget {
  List<Widget> screens = [
    homescrren(),
    ProfileScreen(),
    setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, states) {
          return Scaffold(
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
              selectedItemColor: Color.fromRGBO(1, 205, 170, 70),
              unselectedItemColor: Color.fromRGBO(1, 205, 170, 170),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: MainCubit.GET(context).currentIndex,
              onTap: (index) {
                MainCubit.GET(context).changeNavIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/image/noun-home-4796082.png',
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/image/noun-profile-709597.png',
                    ),
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/image/settings.png',
                    ),
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          );
        });
  }
}
