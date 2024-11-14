import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/core/constant/routes.dart';

class ProfileController extends GetxController{
 
  Map<String,IconData>mp={
    "Profile":Icons.person_2_outlined,
    "Appointement History":Icons.history_edu_outlined,
    "Logout":Icons.logout_outlined,
  };

  void goToLogin(){
    Get.offAllNamed(AppRoutes.login);
  }
}