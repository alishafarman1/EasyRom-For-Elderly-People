import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:easy_rom_prototype/src/shared/app_text_field.dart';
import 'package:easy_rom_prototype/src/shared/custom_keyboard.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return KeyboardDemo();
    locator<SpeechService>().speak("enter_your_password_title".tr());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                'enter_your_password'.tr(),
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
                controller: _controller,
                placeholder: "tap_to_enter_password".tr()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      locator<SpeechService>()
                          .speak("welcome_to_new_phone".tr());
                      NavService.launcher();
                    },
                    child: Text("skip".tr())),
                SizedBox(width: 50),
                ElevatedButton(
                    onPressed: () {
                      locator<SpeechService>()
                          .speak("welcome_to_new_phone".tr());
                      NavService.launcher();
                    },
                    child: Text("next".tr())),
              ],
            ),
            SizedBox(height: 0),
            Spacer(),
            CustomKeyboard(controller: _controller)
          ],
        ),
      ),
    );
  }
}
