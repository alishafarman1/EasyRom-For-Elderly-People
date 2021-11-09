import 'package:easy_rom_prototype/generated/images.asset.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/views/lockscreen.dart';
import 'package:flutter/material.dart';

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
                  speak("Unlocking screen");
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
                  "Right now Weather is 29 degree celcius",
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
                    Text(
                      '12 : 00 AM',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'sunday 7 2021',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: const Color(0xff249fff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              _appIcon("Google Chrome", Images.chrome),
              _appIcon("Facebook", Images.facebook),
              _appIcon("Play Store", Images.playstore),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              _appIcon("Twitter", Images.twitter),
              _appIcon("Instagram", Images.instagram),
              _appIcon("Calculator", Images.calculator),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              _appIcon("Calendar", Images.calendar),
              _appIcon("Settings", Images.settings),
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
              _appIcon("Sms", Images.sms),
              _appIcon("Phone", Images.phone),
              _appIcon("Camera", Images.camera),
            ],
          ),
          SizedBox(height: 30)
        ]),
      );

  Widget _iconCard(String message, Widget child, {Function? onTap}) => Expanded(
        child: GestureDetector(
          onTap: () {
            speak(message);
            onTap?.call();
          },
          child: Container(
            height: 90,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xfff2f2f2),
            ),
            child: child,
          ),
        ),
      );

  Widget _appIcon(String appName, String icon, {Function? onTap}) => _iconCard(
      appName == "Lock Screen" ? "Locking Screen" : "Openning $appName",
      Image.asset(icon),
      onTap: onTap);
}
