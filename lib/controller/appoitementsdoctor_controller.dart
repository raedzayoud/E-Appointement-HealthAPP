import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/routes.dart';

class AppoitementsdoctorController extends GetxController {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String? selectedTime;
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

  void MakeAppointement(){
    if(selectedTime==null || selectedDay==null ){
      Get.defaultDialog(
        title: "Warning",
        titleStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColor.red),
        content: Text("Please choose time to make the appointement"),
      );
    }
    else{
      Get.toNamed(AppRoutes.successappointement);
    }
  }
   
  


}
