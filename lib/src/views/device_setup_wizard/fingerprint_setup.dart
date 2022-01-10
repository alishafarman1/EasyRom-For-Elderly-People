import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FingerprintSetup extends StatelessWidget {
  const FingerprintSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    speak();
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'unlock_with_fingerprint'.tr(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'unlock_with_fingerprint_sub'.tr(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
              onTap: NavService.passwordScreen,
              child: Image.asset(Images.biometric)),
          Spacer(),
          GestureDetector(
            onTap: NavService.passwordScreen,
            child: Container(
                width: context.screenSize().width / 2,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(
                  'skip'.tr(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                )),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }

  void speak() async {
    locator<SpeechService>().speak("setup_fingerprint_now".tr());
    await Future.delayed(Duration(seconds: 2));
    locator<SpeechService>().speak("touch_your_finer_at_the_back".tr());
  }
}
