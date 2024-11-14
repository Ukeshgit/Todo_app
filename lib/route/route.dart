import 'package:get/get.dart';
import 'package:todo_app/app/authentication/pages/login_page.dart';
import 'package:todo_app/app/home/view/screen/home.dart';
import 'package:todo_app/app/splash/splash_screen.dart';

var allpages = [
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/login', page: () => LoginPage()),
];
