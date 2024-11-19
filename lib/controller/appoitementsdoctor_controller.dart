import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/core/class/statusrequest.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/core/function/handledata.dart';
import 'package:health_app/core/services/services.dart';
import 'package:health_app/data/datasource/remote/appointement_data.dart';
import 'package:health_app/data/model/doctormodel.dart';

class AppoitementsdoctorController extends GetxController {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String? selectedTime;
  AppointementData appointementData = AppointementData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Doctormodel ? doctormodel;
  List<String> timeSlots = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
  ];

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    update();
  }

  void onTimeSelected(String? time) {
    selectedTime = time;
    update();
  }

  void MakeAppointement(
      String doctorid, DateTime date, String appointement_heure) async {
    if (selectedTime == null || selectedDay == null) {
      Get.defaultDialog(
        title: "Warning",
        titleStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColor.red),
        content: Text("Please choose time to make the appointement"),
      );
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await appointementData.add(
          myServices.sharedPreferences.getString("id")!,
          doctorid,
          date,
          appointement_heure);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoutes.successappointement);
        } else {
          statusRequest = StatusRequest.failed;
        }
      }

      update();
    }
  }
  
  @override
  void onInit() {
    doctormodel=Get.arguments["doctormodel"];
    super.onInit();
  }



}
