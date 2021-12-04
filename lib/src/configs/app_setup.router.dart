// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/device_setup_wizard/account_sign_in.dart';
import '../views/device_setup_wizard/connect_wifi.dart';
import '../views/device_setup_wizard/fingerprint_setup.dart';
import '../views/device_setup_wizard/insert_sim_view.dart';
import '../views/device_setup_wizard/password_screen.dart';
import '../views/device_setup_wizard/re_password_screen.dart';
import '../views/device_setup_wizard/welcome_view.dart';
import '../views/device_setup_wizard/wifi_connecting.dart';
import '../views/launcher.dart';

class Routes {
  static const String welcomeView = '/';
  static const String insertSimView = '/insert-sim-view';
  static const String connectWifi = '/connect-wifi';
  static const String wifiConnecting = '/wifi-connecting';
  static const String accountSignIn = '/account-sign-in';
  static const String fingerprintSetup = '/fingerprint-setup';
  static const String passwordScreen = '/password-screen';
  static const String rePasswordScreen = '/re-password-screen';
  static const String launcher = '/Launcher';
  static const all = <String>{
    welcomeView,
    insertSimView,
    connectWifi,
    wifiConnecting,
    accountSignIn,
    fingerprintSetup,
    passwordScreen,
    rePasswordScreen,
    launcher,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.insertSimView, page: InsertSimView),
    RouteDef(Routes.connectWifi, page: ConnectWifi),
    RouteDef(Routes.wifiConnecting, page: WifiConnecting),
    RouteDef(Routes.accountSignIn, page: AccountSignIn),
    RouteDef(Routes.fingerprintSetup, page: FingerprintSetup),
    RouteDef(Routes.passwordScreen, page: PasswordScreen),
    RouteDef(Routes.rePasswordScreen, page: RePasswordScreen),
    RouteDef(Routes.launcher, page: Launcher),
  ];

  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    WelcomeView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const WelcomeView(),
        settings: data,
      );
    },
    InsertSimView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const InsertSimView(),
        settings: data,
      );
    },
    ConnectWifi: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const ConnectWifi(),
        settings: data,
      );
    },
    WifiConnecting: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const WifiConnecting(),
        settings: data,
      );
    },
    AccountSignIn: (data) {
      var args = data.getArgs<AccountSignInArguments>(
        orElse: () => AccountSignInArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => AccountSignIn(key: args.key),
        settings: data,
      );
    },
    FingerprintSetup: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const FingerprintSetup(),
        settings: data,
      );
    },
    PasswordScreen: (data) {
      var args = data.getArgs<PasswordScreenArguments>(
        orElse: () => PasswordScreenArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => PasswordScreen(key: args.key),
        settings: data,
      );
    },
    RePasswordScreen: (data) {
      var args = data.getArgs<RePasswordScreenArguments>(
        orElse: () => RePasswordScreenArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => RePasswordScreen(key: args.key),
        settings: data,
      );
    },
    Launcher: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const Launcher(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AccountSignIn arguments holder class
class AccountSignInArguments {
  final Key? key;

  AccountSignInArguments({this.key});
}

/// PasswordScreen arguments holder class
class PasswordScreenArguments {
  final Key? key;

  PasswordScreenArguments({this.key});
}

/// RePasswordScreen arguments holder class
class RePasswordScreenArguments {
  final Key? key;

  RePasswordScreenArguments({this.key});
}
