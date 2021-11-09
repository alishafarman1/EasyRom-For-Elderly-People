import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_rom_prototype/src/base/utils/utils.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  int selectedLang = 1;

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
                  'Welcome',
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
              'Please Choose your language',
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
                        speak("You selected Urdu");
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
                        speak("You selected English");
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
                speak("Insert your sim card now!");
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
            Spacer(),
            GestureDetector(
              onTap: () {
                speak("You just clicked the emergency call button!");
              },
              child: Container(
                  width: context.screenSize().width / 2,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffEB1111),
                  ),
                  child: Text(
                    'Emergency Call',
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
