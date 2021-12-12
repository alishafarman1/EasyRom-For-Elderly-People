import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  int selectedLang = 1;

  @override
  void initState() {
    super.initState();
    (() async {
      await Future.delayed(Duration(milliseconds: 10));
      var selectedLangIndex = Languages.values
          .map((e) => describeEnum(e).split("_").first)
          .toList()
          .indexOf(EasyLocalization.of(context)?.currentLocale?.languageCode ??
              'en');
      setState(() {
        selectedLang = selectedLangIndex == 0 ? 1 : 0;
      });
      locator<SpeechService>().selectedLanguage =
          Languages.values[selectedLangIndex];
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenSize().width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'welcome'.tr(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 37,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 75,
            ),
            Text(
              'choose_language'.tr(),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: context.screenSize().width / 2,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        selectedLang = 0;
                        locator<SpeechService>()
                            .setLanguage(context, Languages.ur_PK);
                        locator<SpeechService>().speak("selected_urdu".tr());
                      }),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedLang == 0
                              ? const Color(0xff249fff)
                              : Colors.white,
                          border: Border.all(
                              width: 1.0, color: const Color(0xff249fff)),
                        ),
                        child: Text(
                          'اردو',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 21,
                            color: selectedLang == 0
                                ? Colors.white
                                : const Color(0xff249fff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        selectedLang = 1;
                        locator<SpeechService>()
                            .setLanguage(context, Languages.en_US);
                        locator<SpeechService>().speak("You selected English");
                      }),
                      child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedLang == 1
                                ? const Color(0xff249fff)
                                : Colors.white,
                            border: Border.all(
                                width: 1.0, color: const Color(0xff249fff)),
                          ),
                          child: Text(
                            'English',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: selectedLang == 1
                                  ? Colors.white
                                  : const Color(0xff249fff),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                NavService.insertSim();
                locator<SpeechService>().speak("insert_sim_now".tr());
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
            Spacer(),
            GestureDetector(
              onTap: () {
                locator<SpeechService>().speak('emergency_call_speak'.tr());
              },
              child: Container(
                  width: context.screenSize().width / 2,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffEB1111),
                  ),
                  child: Text(
                    'emergency_call'.tr(),
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
      ),
    );
    ;
  }
}
