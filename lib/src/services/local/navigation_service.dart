import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/configs/app_setup.router.dart';
import 'package:stacked_services/stacked_services.dart';

class NavService {
  static NavigationService? _navigationService = locator<NavigationService>();

  // key
  static GlobalKey<NavigatorState>? get key => StackedService.navigatorKey;

  // on generate route
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute =>
      StackedRouter().onGenerateRoute;

  // routes with args
  static Future<dynamic>? welcome({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.welcomeView, arguments: arguments);

  static Future<dynamic>? insertSim({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.insertSimView, arguments: arguments);

  static Future<dynamic>? connectWifi({dynamic arguments}) =>
      _navigationService!.navigateTo(Routes.connectWifi, arguments: arguments);

  static Future<dynamic>? wifiConnecting({dynamic arguments}) =>
      _navigationService!
          .navigateTo(Routes.wifiConnecting, arguments: arguments);

  static Future<dynamic>? accountSignIn({dynamic arguments}) =>
      _navigationService!
          .navigateTo(Routes.accountSignIn, arguments: arguments);

  static Future<dynamic>? fingerprintSetup({dynamic arguments}) =>
      _navigationService!
          .navigateTo(Routes.fingerprintSetup, arguments: arguments);

  static Future<dynamic>? passwordScreen({dynamic arguments}) =>
      _navigationService!
          .navigateTo(Routes.passwordScreen, arguments: arguments);

  static Future<dynamic>? rePasswordScreen({dynamic arguments}) =>
      _navigationService!
          .navigateTo(Routes.rePasswordScreen, arguments: arguments);

  static Future<dynamic>? launcher({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.launcher, arguments: arguments);
}
