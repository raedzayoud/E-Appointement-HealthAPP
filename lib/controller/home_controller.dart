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
      "Review": 20,
      "description": "Dr. Alice Roberts is a dedicated general practitioner who believes in providing holistic care to her patients. With experience in diagnosing and treating a broad spectrum of medical conditions, she takes a patient-centered approach, emphasizing prevention, early detection, and long-term health maintenance. Dr. Roberts has experience managing everything from common illnesses to chronic diseases like diabetes, hypertension, and cardiovascular conditions. Her goal is to provide care that empowers patients to live healthier lives by educating them on lifestyle choices and preventive measures.."
},
    {
      "name": "ABCHA Mohammed",
      "image": AppImageassets.doctor1,
      "type": "General",
      "Review": 19,
      "description": "Dr. Alice Roberts is a dedicated general practitioner who believes in providing holistic care to her patients. With experience in diagnosing and treating a broad spectrum of medical conditions, she takes a patient-centered approach, emphasizing prevention, early detection, and long-term health maintenance. Dr. Roberts has experience managing everything from common illnesses to chronic diseases like diabetes, hypertension, and cardiovascular conditions. Her goal is to provide care that empowers patients to live healthier lives by educating them on lifestyle choices and preventive measures.."

    },
    {
      "name": "Zayoud Raed",
      "image": AppImageassets.doctor3,
      "type": "Cardio",
      "Review": 18,
      "description": "Dr. Samuel Johnson has dedicated his career to advancing cardiac care with a focus on early detection and innovative treatment techniques for coronary artery disease and arrhythmias. He is known for his patient-centric approach, educating patients on lifestyle changes and risk reduction. His expertise extends to managing complex cases of heart failure and performing life-saving interventional procedures. Dr. Johnson is a published author in prominent cardiology journals and frequently speaks at national cardiology conferences."

    },
    {
      "name": "Toumi Fourat",
      "image": AppImageassets.doctor4,
      "type": "Dental",
      "Review": 17
    },
    {
      "name": "Mohammed Ali Malli",
      "image": AppImageassets.doctor5,
      "type": "Dermatology",
      "Review": 17
    },
    {
      "name": "Bechir Mansouri",
      "image": AppImageassets.doctor6,
      "type": "Respiration",
      "Review": 17
    },
    {
      "name": "Amine Najjar",
      "image": AppImageassets.doctor7,
      "type": "Gynecology",
      "Review": 17
    },
    {
      "name": "Assil Barhoumi",
      "image": AppImageassets.doctor8,
      "type": "Dental",
      "Review": 17
    },
    {
      "name": "Malek Haddar",
      "image": AppImageassets.doctor9,
      "type": "General",
      "Review": 17
    },
    
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
