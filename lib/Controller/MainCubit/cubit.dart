import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
import 'package:nabdat/Model/AnalysisModel.dart';
import 'package:nabdat/Model/DoctorModel.dart';
import 'package:nabdat/Model/RadiolgyModel.dart';
import 'package:nabdat/Model/UserModel.dart';
import 'package:nabdat/OrderDetailsConfirmed.dart';
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
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";
  bool Booking = false;
  bool canceling = false;

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
        print(value.data['analysis']);
        loadingUserData = false;
        emit(SuccessUserData());
        currentUser = User.fromJson(value.data['data']);
      }).catchError((onError) {
        print(onError);
        loadingUserData = false;
        emit(ErrorUserData());
      });
    }
  }

  void getDoctors() {
    doctors = [];
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
    analysis = [];
    DioHelper.getData(url: AvailableAnalysis).then((value) {
      value.data.forEach((i) {
        analysis.add(Analysis.froJson(i));
      });
    }).catchError((onError) {
      print(onError.response.data);
    });
  }

  bool checkUpcoming() {
    bool check = false;
    currentUser!.reservations.forEach((element) {
      if (element.status == 'upcoming' &&
          element.reservation_date != date.toString().split(" ")[0]) {
        check = true;
      }
    });
    return check;
  }

  void getAvailableRadiology() {
    radiology = [];
    DioHelper.getData(url: AvailableRadiology).then((value) {
      value.data.forEach((i) {
        radiology.add(Radiolgy.froJson(i));
      });
    }).catchError((onError) {
      print(onError.response.data);
    });
  }

  Reservation? getFirstReservation() {
    Reservation? index;
    currentUser!.reservations.reversed.forEach((element) {
      if (element.reservation_date == date.toString().split(" ")[0] &&
          element.status != 'canceled') {
        index = element;
      }
    });
    return index;
  }

  Doctor? getDoctorById(double id) {
    Doctor? doc;
    for (int i = 0; i < doctors.length; i++) {
      if (doctors[i].id == id) {
        doc = doctors[i];
      }
    }
    return doc;
  }

  void setSelectedDate(int Sday) {
    selectedDate = DateTime(2022, date.month, Sday);
  }

  void setSelectedTime(String _selectedTime) {
    selectedTime = _selectedTime;
  }

  void BookAppointment(Doctor doctor, context) {
    print(selectedDate.toString());
    print(selectedTime);
    if (validateBook()) {
      Booking = true;
      emit(LoadingBooking());
      DioHelper.postData(
              url: NewReservation,
              data: {
                "reserved_to": doctor.id,
                "price": doctor.price,
                "reservation_date": selectedDate.toString().split(" ")[0],
                "reservation_time": selectedTime,
                "type": doctor.specialize
              },
              token: "Bearer ${token}")
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => OrderDetailsConfirmed(value.data['id'])),
            (route) => false);
        print(value.data);
        Booking = false;
        emit(SuccessBooking());

        selectedTime = "";
        timeSelectedIndex = null;
        getUserData();
        getDoctors();
        getAvailableRadiology();
        getAvailableAnalysis();
      }).catchError((onError) {
        Booking = false;
        emit(ErrorBooking());
        print(onError);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Please Select Time")
            ],
          )));
    }
  }

  bool validateBook() {
    if (selectedTime != "") {
      return true;
    } else {
      return false;
    }
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
    switch ((day >= 7 ? (day - 7).abs() : day)) {
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
      case 0:
        return [doctor.schedule.sun_time, "Sun"];
      default:
        return null;
    }
  }

  String changeDateFormat(String Odate) {
    List date2 = Odate.split("-");
    String finalDate = "";
    DateTime mydate =
        DateTime(int.parse(date2[0]), int.parse(date2[1]), int.parse(date2[2]));
    switch (mydate.weekday) {
      case 1:
        finalDate += "Mon";
        break;
      case 2:
        finalDate += "Tue";
        break;
      case 3:
        finalDate += "Wed";
        break;
      case 4:
        finalDate += "Thu";
        break;
      case 5:
        finalDate += "Fri";
        break;
      case 6:
        finalDate += "Sat";
        break;
      case 7:
        finalDate += "Sun";
        break;
    }
    switch (mydate.month) {
      case 1:
        finalDate += " Jan";
        break;
      case 2:
        finalDate += " Feb";
        break;
      case 3:
        finalDate += " Mar";
        break;
      case 4:
        finalDate += " Apr";
        break;
      case 5:
        finalDate += " May";
        break;
      case 6:
        finalDate += " Jun";
        break;
      case 7:
        finalDate += " Jul";
        break;
      case 8:
        finalDate += " Aug";
        break;
      case 9:
        finalDate += " Sep";
        break;
      case 10:
        finalDate += " Oct";
        break;
      case 11:
        finalDate += " Nov";
        break;
      case 12:
        finalDate += " Dec";
        break;
    }
    return finalDate + " " + date2[2];
  }

  String changeTimeFormat(String time) {
    var format = DateFormat("HH:mm");
    var time2 = format.parse(time);
    var finalTime;
    if (time2.minute == 0) {
      finalTime = time2.hour.toString() + ":" + "30";
    } else {
      finalTime = (time2.hour + 1).toString() + ":" + "00";
      print(time2);
    }
    return time + "-" + finalTime;
  }

  String AmPm(String time) {
    List t = time.split(":");
    int h = int.parse(t[0]);
    String finaltime = "";
    if (h < 12) {
      finaltime += (time + " AM");
    } else if (h == 12) {
      finaltime = t.join(":") + " PM";
    } else {
      h -= 12;
      t[0] = h.toString();
      finaltime = t.join(":") + " PM";
    }
    return finaltime;
  }

  void cancleBook(double id, context) {
    loadingDoctors = true;
    emit(LoadingCanclle());
    Navigator.pop(context);
    DioHelper.postData(
            url: CancleReservation,
            data: {"reservation_id": id},
            token: "Bearer ${token}")
        .then((value) {
      print(value.data);
      emit(SuccessCancle());
      getUserData();
      getDoctors();
      getAvailableAnalysis();
      getAvailableRadiology();
    }).catchError((onError) {
      print(onError);
      loadingDoctors = false;
      emit(ErrorCancle());
    });
  }
}
