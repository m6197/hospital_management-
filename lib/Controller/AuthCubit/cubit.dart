import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';
import 'package:nabdat/Controller/MainCubit/cubit.dart';
import 'package:nabdat/Shared/network/local/chache_helper.dart';
import 'package:nabdat/Shared/network/remote/dio_helper.dart';
import 'package:nabdat/Shared/network/remote/end_points.dart';
import 'package:nabdat/View/layout/navscrren.dart';
import 'package:nabdat/View/login/forget_password.dart';
import 'package:nabdat/View/login/new_pass.dart';
import 'package:nabdat/View/login/verfivation.dart';

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
  String verificationCode = "";
  String otp = "";
  var emailcontroller_Forget = TextEditingController();
  bool ispassword1_Forget = true;
  bool ispassword2_Forget = true;
  var passcontrol_Forget1 = TextEditingController();
  var passcontrol_Forget2 = TextEditingController();
  bool reset = false;
  var formkeyNewPassForget = GlobalKey<FormState>();
  var formkeyForgetPass = GlobalKey<FormState>();

  //--------------------Methods-----------------//

  void LoginPassShowChange() {
    ispassword_Login = !ispassword_Login;
    emit(PassShowChangeLogin());
  }

  void Forget1PassShowChange() {
    ispassword1_Forget = !ispassword1_Forget;
    emit(PassShowChangeLogin());
  }

  void Forget2PassShowChange() {
    ispassword2_Forget = !ispassword2_Forget;
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

  void forgetPass(String email, context) {
    DioHelper.postData(url: ForgetPasswordEnd, data: {'email': email})
        .then((value) {
      print(value.data);
      otp = value.data['otp'].toString();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VerificationPage()));
    }).catchError((onError) {
      print(onError);
    });
  }

  void addToVerficationCode(String text) {
    verificationCode = text;
    emit(EnterCodeState());
  }

  void verifyOtp(context) {
    if (otp == verificationCode) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewPassForget()));
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
              Text("Wrong OTP")
            ],
          )));
    }
  }

  void resetPassword(context) {
    reset = true;
    emit(ResetLoadingState());
    DioHelper.postData(url: ResetPassword, data: {
      'email': emailcontroller_Forget.text,
      'password': passcontrol_Forget2.text,
      'otp': verificationCode
    }).then((value) {
      print(value.data);
      reset = false;
      emit(ResetSuccesState());
      emailcontrol_Login.text = emailcontroller_Forget.text;
      passcontrol_Login.text = passcontrol_Forget2.text;
      Login(context);
    }).catchError((onError) {
      print(onError.response.data);
      reset = true;
      emit(ResetErrorState());
    });
  }
}
