import 'package:easy_rom_prototype/src/services/local/auth_service.dart';
import 'package:easy_rom_prototype/src/services/local/connectivity_service.dart';
import 'package:easy_rom_prototype/src/services/local/keyboard_service.dart';
import 'package:easy_rom_prototype/src/services/remote/api_service.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/account_sign_in.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/connect_wifi.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/fingerprint_setup.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/insert_sim_view.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/password_screen.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/re_password_screen.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/welcome_view.dart';
import 'package:easy_rom_prototype/src/views/device_setup_wizard/wifi_connecting.dart';
import 'package:easy_rom_prototype/src/views/launcher.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: WelcomeView, initial: true),
    MaterialRoute(page: InsertSimView),
    MaterialRoute(page: ConnectWifi),
    MaterialRoute(page: WifiConnecting),
    MaterialRoute(page: AccountSignIn),
    MaterialRoute(page: FingerprintSetup),
    MaterialRoute(page: PasswordScreen),
    MaterialRoute(page: RePasswordScreen),
    MaterialRoute(page: Launcher),
  ],
  dependencies: [
    // Lazy singletons
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: KeyboardService),
    LazySingleton(classType: ApiService),
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
