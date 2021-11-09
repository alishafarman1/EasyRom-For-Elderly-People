import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:flutter/material.dart';

class WifiConnecting extends StatefulWidget {
  const WifiConnecting({Key? key}) : super(key: key);

  @override
  State<WifiConnecting> createState() => _WifiConnectingState();
}

class _WifiConnectingState extends State<WifiConnecting> {
  @override
  void initState() {
    super.initState();
    moveForward();
  }

  moveForward() async {
    await Future.delayed(Duration(seconds: 2));
    NavService.accountSignIn();
    speak("Connected to Internet!");
    speak("You can now sign in with your google account!");
  }

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
            SizedBox(
              height: 50,
            ),
            Text(
              'Connecting to your wifi network',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(),
            Spacer(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
