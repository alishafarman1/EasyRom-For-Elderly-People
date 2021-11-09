import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
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
              Images.sim,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Please Insert your sim',
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
                speak("Now connect your wifi network to access internet!");
              },
              child: Container(
                  width: context.screenSize().width / 2,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff23DD67),
                  ),
                  child: Text(
                    'Click to Continue',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
