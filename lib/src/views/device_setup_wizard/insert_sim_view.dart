import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:flutter/material.dart';

class InsertSimView extends StatelessWidget {
  const InsertSimView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.simInstructions,
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              "insert_sim".tr(),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                NavService.connectWifi();
                locator<SpeechService>()
                    .speak("now_connect_your_wifi_network".tr());
              },
              child: Container(
                  width: context.screenSize().width / 2,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff23DD67),
                  ),
                  child: Text(
                    'click_to_continue'.tr(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
