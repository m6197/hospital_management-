import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Shared/bloc_observer.dart';
import 'package:nabdat/Shared/network/local/chache_helper.dart';
import 'package:nabdat/Shared/network/remote/dio_helper.dart';
import 'package:nabdat/View/layout/navscrren.dart';

import 'View/login/login_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      await WidgetsFlutterBinding.ensureInitialized();
      await DioHelper.init();
      await CacheHelper.init();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(
                create: (context) => MainCubit()
                  ..getUserData()
                  ..getDoctors())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Home',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: BlocConsumer<MainCubit, MainStates>(
                builder: (context, state) {
                  return MainCubit.GET(context).token == null
                      ? loginScreen()
                      : navscreen();
                },
                listener: (context, state) {}),
          ),
        );
      },
    );
  }
}
