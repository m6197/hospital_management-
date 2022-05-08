import 'package:flutter/material.dart';

Widget defaultButton({
  double width: double.infinity,
   Color background = Colors.blue,
  required  VoidCallback function,
  required String text,
}) =>
    Container(

  width: width,
  child: ElevatedButton(

style: ButtonStyle(
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15.0),
)
)
),

    onPressed: function,

    child: Text (
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),

    );







Widget defaultformfiled ({
  required TextEditingController controller,
  required TextInputType type,
  final String? Function(String?)? onSubmit,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixpressed,



}) => TextFormField(
controller: controller,
onFieldSubmitted: onSubmit,
keyboardType:  TextInputType.emailAddress,
validator: validate,
obscureText: isPassword,
decoration: InputDecoration(
labelText: label,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(15.0),

),
prefixIcon: Icon(
  prefix,
    color: Colors.greenAccent,
),
  suffixIcon: suffix != null ? IconButton(
    icon: Icon(
      suffix,
      color: Colors.greenAccent,
    ), onPressed: suffixpressed,
  ) : null,
),
);




