import 'package:get/get.dart';
import 'package:todo_app/app/authentication/pages/auth_page.dart';
import 'package:todo_app/app/authentication/pages/login_page.dart';
import 'package:todo_app/app/authentication/pages/signup_page.dart';
import 'package:todo_app/app/home/view/screen/home.dart';
import 'package:todo_app/app/splash/splash_screen.dart';

var allpages = [
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/auth', page: () => AuthPage()),
  GetPage(name: '/signup', page: () => SignupPage()),
];
