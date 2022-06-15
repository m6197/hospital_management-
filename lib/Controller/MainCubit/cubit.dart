import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Model/AnalysisModel.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import 'package:nabdat/Model/RadiolgyModel.dart';
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
  DateTime date = DateTime.now();
  List<String> specialize = [];
  List<Analysis> analysis = [];
  List<Radiolgy> radiology = [];

  int? SelectedDoctorDateIndex = 0;
  int? timeRowSelectedIndex = null;
  int? timeSelectedIndex = 0;

  //------------Methods-----------------//
  void changeNavIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  void ChangeSelectedDoctorDateIndex(int? index) {
    SelectedDoctorDateIndex = index;
    print(SelectedDoctorDateIndex);
    emit(ChangeSelectedDoctorDateIndexState());
  }

  int? getScheduleListRows(List available) {
    return (available[SelectedDoctorDateIndex!][1][0].length / 4).ceil();
  }

  List getScheduleTotalItems(List available) {
    List nums = [];
    int length = available[SelectedDoctorDateIndex!][1][0].length;
    if (length <= 4) {
      nums.add(length);
    } else {
      for (int i = 0; i < (length / 4).ceil(); i++) {
        i != (length / 4).ceil() - 1 ? nums.add(4) : nums.add(length - (4 * i));
      }
    }
    return nums;
  }

  void changeSelectedDate(int? index, int row) {
    timeRowSelectedIndex = row;
    timeSelectedIndex = index;
    emit(ChangeSelectedDoctorDateIndexState());
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
      print(value.data.length);
      value.data.forEach((i) {
        doctors.add(Doctor.fromJson(i));
        if (!(specialize.contains(i['specialize']))) {
          specialize.add(i['specialize']);
        }
        specialize.remove('Analysis');
        specialize.remove('Radiology');
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

  void getAvailableDoctors(String day) {
    List<Doctor> availableDoctors = [];
    doctors.forEach((element) {});
  }

  void getAvailableAnalysis() {
    DioHelper.getData(url: AvailableAnalysis).then((value) {
      value.data.forEach((i) {
        analysis.add(Analysis.froJson(i));
      });
    }).catchError((onError) {
      print(onError.response.data);
    });
  }

  void getAvailableRadiology() {
    DioHelper.getData(url: AvailableRadiology).then((value) {
      value.data.forEach((i) {
        radiology.add(Radiolgy.froJson(i));
      });
    }).catchError((onError) {
      print(onError.response.data);
    });
  }

  List availableDates(Doctor doctor) {
    return [
      [date.day, getDaySchedule(date.weekday, doctor)],
      [date.day + 1, getDaySchedule(date.weekday + 1, doctor)],
      [date.day + 2, getDaySchedule(date.weekday + 2, doctor)],
      [date.day + 3, getDaySchedule(date.weekday + 3, doctor)],
    ];
  }

  List? getDaySchedule(int day, Doctor doctor) {
    switch (day) {
      case 1:
        return [doctor.schedule.mon_time, "Mon"];
      case 2:
        return [doctor.schedule.tue_time, "Tue"];
      case 3:
        return [doctor.schedule.wed_time, "Wed"];
      case 4:
        return [doctor.schedule.thu_time, "Thu"];
      case 5:
        return [doctor.schedule.fri_time, "Fri"];
      case 6:
        return [doctor.schedule.sat_time, "Sat"];
      case 7:
        return [doctor.schedule.sun_time, "Sun"];
      default:
        return null;
    }
  }
}
