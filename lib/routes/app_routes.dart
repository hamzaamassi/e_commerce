part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const login = _Paths.login;
  static const register = _Paths.register;
  static const splash = _Paths.splash;
  static const appBottomBar = _Paths.appBottomBar;
  static const profile = _Paths.profile;
  static const editProfile = _Paths.editProfile;
}

abstract class _Paths {
  _Paths._();

  static const login = '/login';
  static const register = '/register';
  static const splash = '/splash';
  static const appBottomBar = '/app_bottom_bar';
  static const home = '/home';
  static const profile = '/profile';
  static const editProfile = '/edit_profile';

}
