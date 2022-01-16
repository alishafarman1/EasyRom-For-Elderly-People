import 'package:easy_rom_prototype/src/shared/app_text_field.dart';
import 'package:easy_rom_prototype/src/shared/custom_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class DialerApp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  DialerApp({Key? key}) : super(key: key);

  GestureTapCallback? onBackSpace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Text(
            "No Recent Calls!",
            style: TextStyle(fontSize: 35),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                      placeholder: "", controller: _controller, isDialer: true),
                ),
              ),
              Container(
                color: const Color(0xffeeeeee),
                height: 65,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    if (onBackSpace != null) {
                      onBackSpace!();
                    }
                  },
                  child: Icon(Icons.backspace, color: Colors.black),
                ),
              )
            ],
          ),
          Stack(
            children: [
              CustomKeyboard(
                  controller: _controller,
                  isDialer: true,
                  onInit: (state) {
                    onBackSpace = () {
                      state.backspace();
                    };
                  }),
              Positioned(
                right: 30,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(65 / 2)),
                  height: 65,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      launch("tel:${_controller.text}");
                    },
                    child: Icon(Icons.call, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
