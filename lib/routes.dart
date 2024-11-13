import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/view/scrren/auth/login.dart';
import 'package:health_app/view/scrren/auth/signup.dart';
import 'package:health_app/view/scrren/home.dart';
import 'package:health_app/view/scrren/homescrren.dart';

List<GetPage<dynamic>>? getPages = [
// GetPage(name: "/", page: () => Onborading(),middlewares: [Mymiddleware()]),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.singup, page: () => Singup()),
  GetPage(name: AppRoutes.home, page: () => Home()),
  GetPage(name: AppRoutes.homescrren, page: () => Homescrren()),
 //  GetPage(name: "/", page: () => Test()),
 

];