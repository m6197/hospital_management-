import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import 'package:nabdat/Model/UserModel.dart';
import 'package:nabdat/Shared/network/local/chache_helper.dart';
import 'package:nabdat/Shared/network/remote/end_points.dart';

import '../../Shared/network/remote/dio_helper.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitState());

  static MainCubit GET(context) => BlocProvider.of(context);

  //--------------Variables--------------//
  String? token = CacheHelper.getData(key: "token");
  User? currentUser;
  bool loadingUserData = false;
  int currentIndex = 0;
  bool loadingDoctors = false;
  List<Doctor> doctors = [];
  //------------Methods-----------------//
  void changeNavIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  void getUserData() {
    if (token != null) {
      loadingUserData = true;
      emit(LoadingUserData());
      DioHelper.getData(url: UserData, token: "Bearer ${token}").then((value) {
        print(value.data);
        loadingUserData = false;
        emit(SuccessUserData());
        currentUser = User.fromJson(value.data['data']);
      }).catchError((onError) {
        print(onError.response.data);
        loadingUserData = false;
        emit(ErrorUserData());
      });
    }
  }

  void getDoctors() {
    loadingDoctors = true;
    emit(LoadingDoctorData());
    DioHelper.getData(url: GetDoctors).then((value) {
      print(value.data);
      value.data.forEach((i) {
        doctors.add(Doctor.fromJson(i));
      });
      print(doctors.length);
      loadingDoctors = false;
      emit(SuccessDoctorData());
    }).catchError((onError) {
      print(onError);
      loadingDoctors = false;
      emit(ErrorDoctorData());
    });
  }
}
