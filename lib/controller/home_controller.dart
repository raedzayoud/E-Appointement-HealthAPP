import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:health_app/core/class/statusrequest.dart';
import 'package:health_app/core/constant/imageassets.dart';
import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/core/function/handledata.dart';
import 'package:health_app/data/datasource/remote/doctor_data.dart';
import 'package:health_app/data/model/doctormodel.dart';

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

  List<Doctormodel> TopdataDoctor = [];
  StatusRequest statusRequest = StatusRequest.none;
  DoctorData doctorData = DoctorData(Get.find());
  Doctormodel? doctormodel;

  void goToDoctorDetails(String image, String name, String type) {
    Get.toNamed(AppRoutes.doctordetails, arguments: {
      "image": image,
      "name": name,
      "type": type,
    });
  }

  void goToCategoriesDetails(String name, IconData icon) {
    Get.toNamed(AppRoutes.typecategories, arguments: {
      "icon": icon,
      "name": name,
    });
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await doctorData.postData();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        TopdataDoctor = data.map((e) => Doctormodel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
