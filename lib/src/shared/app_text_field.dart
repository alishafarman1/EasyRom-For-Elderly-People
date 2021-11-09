import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool isPassword;

  const AppTextField(
      {required this.placeholder,
      required this.controller,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
      ),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        autofocus: true,
        readOnly: true,
        showCursor: true,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: placeholder),
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
