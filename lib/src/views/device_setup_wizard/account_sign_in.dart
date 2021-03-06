import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:easy_rom_prototype/src/shared/app_text_field.dart';
import 'package:easy_rom_prototype/src/shared/custom_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AccountSignIn extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  AccountSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<SpeechService>().speak("google_account_sin_in".tr());
    //return KeyboardDemo();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'add_your_account'.tr(),
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
            Image.asset(Images.google),
            SizedBox(height: 30),
            AppTextField(
                controller: _controller,
                placeholder: "tap_to_enter_gmail_id".tr()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      NavService.launcher();
                      locator<SpeechService>()
                          .speak("welcome_to_new_phone".tr());
                    },
                    child: Text("skip".tr())),
                SizedBox(width: 50),
                ElevatedButton(
                    onPressed: () async {
                      NavService.passwordScreen();
                    },
                    child: Text("next".tr()))
              ],
            ),
            SizedBox(height: 10),
            Spacer(),
            CustomKeyboard(controller: _controller)
          ],
        ),
      ),
    );
  }
}
