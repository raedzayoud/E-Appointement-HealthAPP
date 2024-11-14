import 'package:get/get.dart';
import 'package:health_app/core/constant/routes.dart';

class DoctordetailsController extends GetxController {
  //when i use the database use the doctormodel insetead of these variables

  Map DataDoctorDetails = {
    "Patients":"56",
    "Expereiences":"9",
    "Rating":"4.0",
  };

  String urlImage = "";
  String name = "";
  String type = "";

  @override
  void onInit() {
    urlImage = Get.arguments['image'];
    name = Get.arguments['name'];
    type = Get.arguments['type'];
    super.onInit();
  }
  
  void goToBookAppointements(){
    Get.toNamed(AppRoutes.appoitementsSchedule);
  }

}
