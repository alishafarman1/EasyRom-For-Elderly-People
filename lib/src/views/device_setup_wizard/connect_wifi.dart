import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:flutter/material.dart';

class ConnectWifi extends StatelessWidget {
  const ConnectWifi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              Images.wifi,
              width: 100,
              height: 100,
            ),
            Spacer(),
            ...["Maju Connect", "Home Internet", "Lab Wifi"]
                .map((wifiName) => GestureDetector(
                      onTap: () {
                        NavService.wifiConnecting();
                        speak("Connecting network $wifiName!");
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        margin:
                            EdgeInsets.only(bottom: 15, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                wifiName,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Image.asset(Images.wifiNetwork)
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xfff2f2f2),
                        ),
                      ),
                    ))
                .toList(),
            Spacer(),
            Spacer(),
            Spacer(),
            GestureDetector(
              onTap: NavService.connectWifi,
              child: Container(
                  width: context.screenSize().width / 2,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff23DD67),
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  )),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
