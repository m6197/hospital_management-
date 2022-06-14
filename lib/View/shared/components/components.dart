import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultButton(
        {double width: double.infinity,
        Color background = Colors.blue,
        required VoidCallback function,
        required String text,
        bool isLoading = false}) =>
    Container(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(1, 205, 170, 70),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0.r),
          )),
        ),
        onPressed: function,
        child: isLoading == true
            ? Container(
                height: 30.h,
                width: 30.h,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
    );

Widget defaultformfiled({
  required TextEditingController controller,
  required TextInputType type,
  final String? Function(String?)? onSubmit,
  required String? Function(String?)? validate,
  required String label,
  IconData? prefix,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixpressed,
}) =>
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      onFieldSubmitted: onSubmit,
      keyboardType: TextInputType.emailAddress,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: BorderSide(
            color: Color.fromRGBO(1, 205, 170, 70),
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Color.fromRGBO(35, 32, 32, 100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: BorderSide(
            color: Color.fromRGBO(1, 205, 170, 70),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        prefixIcon: Icon(
          prefix,
          color: Color.fromRGBO(1, 205, 170, 70),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: Color.fromRGBO(1, 205, 170, 70),
                ),
                onPressed: suffixpressed,
              )
            : null,
      ),
    );
