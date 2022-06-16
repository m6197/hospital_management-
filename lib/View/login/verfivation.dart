import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdat/Controller/AuthCubit/cubit.dart';
import 'package:nabdat/Controller/AuthCubit/states.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = AuthCubit.GET(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(1, 205, 170, 70),
              ),
              onPressed: () {
                cubit.verificationCode = "";
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter the verification code we just sent you on your Email Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    child: PinCodeTextField(
                        keyboardType: TextInputType.number,
                        appContext: context,
                        cursorColor: Color.fromRGBO(1, 205, 170, 70),
                        length: 5,
                        onChanged: (text) {
                          cubit.addToVerficationCode(text);
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You didn't receive a code ?",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "RESEND",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10.r),
                    width: double.infinity,
                    height: 46.h,
                    child: ElevatedButton(
                        onPressed: cubit.verificationCode.length < 5
                            ? null
                            : () {
                                cubit.verifyOtp(context);
                              },
                        child: Text(
                          "VERIFY",
                          style: TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold,
                              color: cubit.verificationCode.length < 5
                                  ? Colors.grey[700]
                                  : Colors.white),
                        ),
                        style: ButtonStyle(
                            enableFeedback: true,
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0.r),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                cubit.verificationCode.length < 5
                                    ? Colors.grey
                                    : Color.fromRGBO(1, 205, 170, 70)))),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
