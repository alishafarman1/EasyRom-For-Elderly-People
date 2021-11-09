import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:flutter/material.dart';

class FingerprintSetup extends StatelessWidget {
  const FingerprintSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'Unlock your fingerprint',
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
                  'use your fingerprints to unlock your phone or\napprove purchase',
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
          SizedBox(height: 50)
        ],
      ),
    );
  }
}