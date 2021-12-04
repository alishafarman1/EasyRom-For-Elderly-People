import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:easy_rom_prototype/src/shared/app_text_field.dart';
import 'package:easy_rom_prototype/src/shared/custom_keyboard.dart';
import 'package:flutter/material.dart';

class RePasswordScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  RePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return KeyboardDemo();
    locator<SpeechService>().speak("Re-Enter your password to complete setup!");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                'Re enter your Password',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Image.asset(Images.padlock),
            SizedBox(height: 30),
            AppTextField(
                isPassword: true,
                controller: _controller,
                placeholder: "Tap to re-enter your password!"),
            ElevatedButton(
                onPressed: () {
                  NavService.launcher();
                  locator<SpeechService>()
                      .speak("Welcome to your new smart phone");
                },
                child: Text("NEXT")),
            SizedBox(height: 10),
            Spacer(),
            CustomKeyboard(controller: _controller)
          ],
        ),
      ),
    );
  }
}
