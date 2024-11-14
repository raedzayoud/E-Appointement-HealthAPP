import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:health_app/core/constant/imageassets.dart';
import 'package:health_app/core/constant/routes.dart';

class HomeController extends GetxController {
  Map<String, IconData> mp = {
    "General": FontAwesomeIcons.userDoctor,
    "Cardiology": FontAwesomeIcons
        .heartPulse, // Representing cardiology with a heart icon
    "Respiration":
        FontAwesomeIcons.lungs, // Representing respiration with an air icon
    "Dermatology": FontAwesomeIcons.hand,
    "Gynecology": FontAwesomeIcons.personPregnant,
    "Dental": FontAwesomeIcons.teeth,
  };

  List TopdataDoctor = [
    {
      "name": "ABAZA Halima",
      "image": AppImageassets.doctor2,
      "type": "General",
      "Review": 20
    },
    {
      "name": "ABCHA Mohammed",
      "image": AppImageassets.doctor1,
      "type": "General",
      "Review": 19
    },
    {
      "name": "Zayoud Raed",
      "image": AppImageassets.doctor3,
      "type": "Cardio",
      "Review": 18
    },
    {
      "name": "Toumi Fourat",
      "image": AppImageassets.doctor4,
      "type": "Denitist",
      "Review": 17
    }
  ];

  void goToDoctorDetails(String image,String name,String type) {

    Get.toNamed(
      AppRoutes.doctordetails,arguments: {
        "image":image,
        "name":name,
        "type":type,
      }
    );

  }
}
