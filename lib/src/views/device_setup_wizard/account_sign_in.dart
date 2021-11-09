import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/shared/app_text_field.dart';
import 'package:easy_rom_prototype/src/shared/custom_keyboard.dart';
import 'package:flutter/material.dart';

class AccountSignIn extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  AccountSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return KeyboardDemo();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'Add your account',
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
                placeholder: "Tap to enter your gmail accoung id here!"),
            ElevatedButton(
                onPressed: () async {
                  NavService.fingerprintSetup();
                  speak("Setup your fingerprint now!");
                  await Future.delayed(Duration(seconds: 2));
                  speak("Touch your finger on the back of your device!");
                },
                child: Text("NEXT")),
            SizedBox(height: 30),
            Spacer(),
            CustomKeyboard(controller: _controller)
          ],
        ),
      ),
    );
  }
}
