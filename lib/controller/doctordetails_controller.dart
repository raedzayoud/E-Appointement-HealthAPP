import 'package:get/get.dart';
import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/data/model/doctormodel.dart';

class DoctordetailsController extends GetxController {
  //when i use the database use the doctormodel insetead of these variables

  Map DataDoctorDetails = {
    "Patients": "56",
    "Expereiences": "9",
    "Rating": "4.0",
  };

  Doctormodel? doctormodel;

  @override
  void onInit() {
    doctormodel = Get.arguments["doctormodel"];
    super.onInit();
  }

  void goToBookAppointements() {
    Get.toNamed(AppRoutes.appoitementsSchedule,
        arguments: {"doctormodel": doctormodel});
  }
}
