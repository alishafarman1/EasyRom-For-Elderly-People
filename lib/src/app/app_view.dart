import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_rom_prototype/src/base/utils/constants.dart';
import 'package:easy_rom_prototype/src/services/local/navigation_service.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/welcome_view.dart';

class AppView extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavService.onGenerateRoute,
      navigatorKey: NavService.key,
      home: WelcomeView(),
      builder: (context, child) {
        return Stack(
          children: [child!],
        );
      },
    );
  }
}
