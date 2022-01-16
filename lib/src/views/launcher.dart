import 'package:easy_localization/src/public_ext.dart';
import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:easy_rom_prototype/src/views/lockscreen.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _launcher(),
          AnimatedCrossFade(
              alignment: Alignment.center,
              duration: Duration(milliseconds: 500),
              crossFadeState: crossFadeState,
              secondChild: Lockscreen(
                onUnlock: () => setState(() {
                  crossFadeState = CrossFadeState.showFirst;
                  locator<SpeechService>().speak("unlocking_screen".tr());
                }),
              ),
              firstChild: SizedBox()),
        ],
      ),
    );
  }

  Widget _launcher() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(children: [
          SizedBox(height: 50),
          Row(
            children: [
              _iconCard(
                  "temperature".tr(),
                  Column(
                    children: [
                      Image.asset(Images.weather),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: const Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                              text: '29',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text: ' ℃',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )),
              Spacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        locator<SpeechService>().speak("time_locale".tr());
                      },
                      child: Text(
                        '12 : 00 AM',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        locator<SpeechService>().speak("date_locate".tr());
                      },
                      child: Text(
                        "date_locate".tr(),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          color: const Color(0xff249fff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              _appIcon("Google Chrome", Images.chrome,
                  packageName: "com.android.chrome"),
              _appIcon("Facebook", Images.facebook,
                  packageName: "com.facebook.katana"),
              _appIcon("Play Store", Images.playstore,
                  packageName: "com.android.vending"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              _appIcon("Alarm", Images.clock,
                  packageName: "com.google.android.deskclock",
                  padding: EdgeInsets.all(20)),
              _appIcon("WhatsApp", Images.whatsapp,
                  packageName: "com.whatsapp", padding: EdgeInsets.all(20)),
              _appIcon("Calculator", Images.calculator,
                  packageName: "com.google.android.calculator"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              _appIcon("Calendar", Images.calendar,
                  packageName: "com.google.android.calendar"),
              _appIcon("Settings", Images.settings,
                  packageName: "com.android.settings"),
              _appIcon("Lock Screen", Images.padlock, onTap: () {
                setState(() {
                  crossFadeState = CrossFadeState.showSecond;
                });
              }),
            ],
          ),
          Spacer(),
          Row(
            children: [
              _appIcon("Sms", Images.sms, onTap: NavService.messagesApp),
              _appIcon("Phone", Images.phone, onTap: NavService.dialerApp),
              _appIcon("Camera", Images.camera,
                  packageName: "com.google.android.GoogleCamera"),
            ],
          ),
          SizedBox(height: 30)
        ]),
      );

  Widget _iconCard(String message, Widget child,
          {Function? onTap,
          EdgeInsets padding =
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10)}) =>
      Expanded(
        child: GestureDetector(
          onTap: () {
            locator<SpeechService>().speak(message);
            onTap?.call();
          },
          child: Container(
            height: 90,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: padding,
            decoration: BoxDecoration(
              color: const Color(0xfff2f2f2),
            ),
            child: child,
          ),
        ),
      );

  Widget _appIcon(String appName, String icon,
          {Function? onTap,
          String? packageName,
          EdgeInsets padding =
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10)}) =>
      _iconCard(
          appName == "Lock Screen"
              ? "locking_screen".tr()
              : "opening_app".tr(args: [appName]),
          Image.asset(icon),
          padding: padding,
          onTap: packageName != null
              ? () {
                  LaunchApp.openApp(androidPackageName: packageName);
                }
              : onTap);
}
