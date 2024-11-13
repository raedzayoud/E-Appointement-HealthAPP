import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/view/scrren/appointements.dart';
import 'package:health_app/view/scrren/favourite.dart';
import 'package:health_app/view/scrren/home.dart';
import 'package:health_app/view/scrren/profile.dart';

class HomescreenController extends GetxController{
    
    int currentindex=0;

    List<Widget> list = [
    Home(),
    Favourite(),
    Appointements(),
    Profile()
  ];

  void changeindex(int val){
    currentindex=val;
    update();
  }
}