import 'package:cafe_app_project/logic/Bindings/main_binding.dart';
import 'package:cafe_app_project/view/screens/main_screen.dart';
import 'package:cafe_app_project/view/screens/setting/settingBar.dart';

import 'package:get/get.dart';

import '../View/Screens/admin/stock_screen.dart';
import '../logic/Bindings/auth_bindig.dart';
import '../logic/Bindings/product_binding.dart';
import '../view/screens/admin/Add_product_form_screen.dart';
import '../view/screens/auth/forget_password.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/singup.dart';
import '../view/screens/cart_screen.dart';

import '../view/screens/setting/edit_profile_screen.dart';
import '../view/screens/setting/profile.dart';

import '../view/screens/setting/settings_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
//  initialRoute
  static const welcome = Routes.welcomeScreen;
  static const sigup = Routes.signupScreen;
  static const login = Routes.loginScreen;
  static const forget_pass = Routes.forgetPasswordScreen;
  static const tabelNumber = Routes.tabel_number;
  static const mainScreen = Routes.main_Screen;
  static const cart_Screen = Routes.cartScreen;

  static const stock = Routes.stockScreen;
  static const addProduct = Routes.addProductForm;

  static const edit = Routes.editProfileScreen;
  static const profile = Routes.profileScreen;
  static const setting = Routes.settingsScreen;
  static const setting_bar = Routes.settingBar;
//getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signupScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),

    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.main_Screen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBindng(),
        ProductBinding(),
      ],
    ),

    GetPage(
        name: Routes.stockScreen,
        page: () => StockScreen(),
        binding: ProductBinding()),

    GetPage(
        name: Routes.addProductForm,
        page: () => AddProductFromScreen(),
        binding: ProductBinding()),
    // GetPage(name: Routes.customerHome, page: () => CustomerHome()),

    GetPage(name: Routes.profileScreen, page: () => ProfileScreen()),

    GetPage(name: Routes.editProfileScreen, page: () => EditProfileScreen()),

    GetPage(
      name: Routes.settingsScreen,
      page: () => SettingScreen(),
    ),
    //
    //
    //
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [AuthBinding(), ProductBinding()],
    ),

    GetPage(name: Routes.settingBar, page: () => SettingBar()),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/Login_Screen';
  static const signupScreen = '/SignUpScreen';
  static const forgetPasswordScreen = '/ForgotPasswordScreen';
  static const main_Screen = '/MainScreen';

  static const tabel_number = '/Table_Number_screen';
  static const stockScreen = '/StockScreen';
  static const cartScreen = '/CartScreen';

  static const addProductForm = '/AddProductFromScreen';
  static const editProduct = '/EditProductScreen';

  static const profileScreen = '/ProfileScreen';
  static const editProfileScreen = '/EditProfileScreen';
  static const settingsScreen = '/SettingScreen';
  static const settingBar = '/SettingBar';
}
