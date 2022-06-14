import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Shared/network/local/chache_helper.dart';
import 'package:nabdat/Shared/network/remote/dio_helper.dart';
import 'package:nabdat/Shared/network/remote/end_points.dart';
import 'package:nabdat/View/layout/navscrren.dart';

import '../../Model/UserModel.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());
  static AuthCubit GET(context) => BlocProvider.of(context);

  //--------------------Variables-----------------//
  var emailcontrol_Login = TextEditingController();
  var passcontrol_Login = TextEditingController();
  var formkey_Login = GlobalKey<FormState>();
  bool ispassword_Login = true;
  bool isLogging = false;
  var Usercontrol_Signup = TextEditingController();
  var formkey_Signup = GlobalKey<FormState>();
  var emailcontrol_Signup = TextEditingController();
  var passcontrol_Signup = TextEditingController();
  var phonecontroller_Signup = TextEditingController();
  bool ispassword_Signup = true;
  //--------------------Methods-----------------//

  void LoginPassShowChange() {
    ispassword_Login = !ispassword_Login;
    emit(PassShowChangeLogin());
  }

  void SignupPassShowChange() {
    ispassword_Signup = !ispassword_Signup;
    emit(PassShowChangeSignup());
  }

  void Login(var context) {
    isLogging = true;
    emit(LoginLoadingState());
    DioHelper.postData(url: LoginEndPoint, data: {
      "email": emailcontrol_Login.text,
      "password": passcontrol_Login.text
    }).then((value) {
      print(value.data);
      CacheHelper.saveData(key: "token", value: value.data['data']['token'])
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navscreen()));
      });
      isLogging = false;
      emit(LoginSuccesState());
      MainCubit.GET(context).token = value.data['data']['token'];
      MainCubit.GET(context).getUserData();
      MainCubit.GET(context).getAvailableAnalysis();
      MainCubit.GET(context).getDoctors();

      emailcontrol_Login.text = "";
      passcontrol_Login.text = "";
    }).catchError((e) {
      print(e.response.data['message']);
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
              Text(e.response.data['message'])
            ],
          )));
      isLogging = false;
      emit(LoginErrorState());
    });
  }

  void Signup(var context) {
    isLogging = true;
    emit(SignupLoadingState());
    DioHelper.postData(url: SignupEndPoint, data: {
      "email": emailcontrol_Signup.text,
      "password": passcontrol_Signup.text,
      "name": Usercontrol_Signup.text,
      "phone": phonecontroller_Signup.text
    }).then((value) {
      print(value.data);
      emailcontrol_Login.text = emailcontrol_Signup.text;
      passcontrol_Login.text = passcontrol_Signup.text;
      Login(context);
      isLogging = false;
      emit(SignupSuccesState());
    }).catchError((e) {
      print(e.response.data['message']);
      isLogging = false;
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
              Text(e.response.data['message'])
            ],
          )));
      emit(SignupErrorState());
    });
  }
}
