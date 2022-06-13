import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdat/Controller/MainCubit/states.dart';
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
}
