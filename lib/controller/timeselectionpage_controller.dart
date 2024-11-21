import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/appoitements_controller.dart';
import 'package:health_app/core/class/statusrequest.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/core/function/handledata.dart';
import 'package:health_app/core/services/services.dart';
import 'package:health_app/data/datasource/remote/appointement_data.dart';
import 'package:health_app/data/datasource/remote/time_data.dart';
import 'package:health_app/data/model/appointementmodel.dart';

class TimeselectionpageController extends GetxController {
  String type = "Upcoming";
  StatusRequest statusRequest = StatusRequest.none;
  TimeData timeData = TimeData(Get.find());
  AppointementData timeData1 = AppointementData(Get.find());
  MyServices myServices = Get.find();
  List<appointementmodel> list = [];

  AppoitementsController appoitementsController=Get.find();  

  String doctorId = "";
  String appointementdate = "";
  String? selectedTime;
  appointementmodel? a;

  void onTimeSelected(String? time) {
    selectedTime = time;
    update();
  }

  loadTimeIsNotAvailable(String doctorId, String appointementdate) async {
    
     print("====================================="+appointementdate);
    statusRequest = StatusRequest.loading;
    update();
    list.clear();
    var response = await timeData.manageTime(doctorId, appointementdate);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list = data.map((e) => appointementmodel.fromJson(e)).toList();
        print(list);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  resheduleAppointement(String appointementheure, String appointementdate,
      String appointementid) async {
    // Set the loading state before making the request
    statusRequest = StatusRequest.loading;
    update();

    // Send request to reschedule the appointment
    var response = await timeData1.resheduleapp(
      appointementheure,
      appointementdate,
      myServices.sharedPreferences.getString("id")!,
      appointementid,
    );

    // If response is null, set the status to failed and update
    if (response == null) {
      statusRequest = StatusRequest.failed;
      update();
      return; // Exit early if no response is received
    }

    // Handle the response
    statusRequest = HandleData(response);
    update();

    // If status is success, check for the actual response success
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // Show success dialog
        Get.defaultDialog(
          title: "Success",
          middleText: "Appointment rescheduled successfully",
          titleStyle: TextStyle(color: AppColor.primaycolor),
        );

        Future.delayed(Duration(seconds: 1));
        
        Get.offAllNamed(AppRoutes.homescrren);
        
      } else {
        // If the status in the response is not success, set the status to failed
        statusRequest = StatusRequest.failed;
        update();
      }
    } else {
      // If the statusRequest is not success, handle accordingly
      statusRequest = StatusRequest.failed;
      update();
    }
  }

  @override
  void onInit() {
     doctorId = Get.arguments["doctorid"];
     appointementdate = Get.arguments["appointementdate"];
     a = Get.arguments["appointementmodel"];
    loadTimeIsNotAvailable(doctorId, appointementdate);
    super.onInit();
  }
}
