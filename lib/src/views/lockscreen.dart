import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Lockscreen extends StatelessWidget {
  final Function onUnlock;

  const Lockscreen({required this.onUnlock});

  @override
  Widget build(BuildContext context) {
    var blur = 10.0;
    return GestureDetector(
      onTap: () => onUnlock(),
      child: new Container(
        width: MediaQuery.of(context).size.width,
        //I blured the parent container to blur background image, you can get rid of this part
        child: new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: new Container(
            //you can change opacity with color here(I used black) for background.
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.5)),
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  '12 : 00 AM',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'sunday 7 2021',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 19,
                    color: const Color(0xff249fff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Container(
                  width: 150,
                  height: 150,
                  child: Text(
                    "unlock_screen".tr(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(75)),
                ),
                SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
