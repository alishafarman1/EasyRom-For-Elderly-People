import 'package:easy_rom_prototype/src/models/user.dart';
import 'package:stacked/stacked.dart';

class AuthService with ReactiveServiceMixin {
  ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  User? get user => _user.value;

  AuthService() {
    listenToReactiveValues([_user]);
  }

  set user(User? user) {
    _user.value = user;
  }
}
