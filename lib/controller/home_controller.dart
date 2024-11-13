import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/core/constant/imageassets.dart';

class HomeController extends GetxController{
  
  Map<String, IconData> mp = {
      "General": Icons.person,
      "Cardiology": Icons.favorite, // Representing cardiology with a heart icon
      "Respiration": Icons.air, // Representing respiration with an air icon
      "Dentist":
          Icons.medical_services, // Representing dental with a medical icon
    };

   
  List TopdataDoctor=[{
    "name":"ABAZA Halima",
    "image":AppImageassets.doctor2,
    "type":"General",
    "Review":20
  },
  {
    "name":"ABCHA Mohammed",
    "image":AppImageassets.doctor1,
    "type":"General",
    "Review":19
  },
  {
    "name":"Zayoud Raed",
    "image":AppImageassets.doctor3,
    "type":"Cardio",
    "Review":18
  },
  {
    "name":"Toumi Fourat",
    "image":AppImageassets.doctor4,
    "type":"Denitist",
    "Review":17
  }
  
  ];
}