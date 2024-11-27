import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/favourite_controller.dart';
import 'package:health_app/core/class/statusrequest.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/core/function/handledata.dart';
import 'package:health_app/core/services/services.dart';
import 'package:health_app/data/datasource/remote/comment_data.dart';
import 'package:health_app/data/datasource/remote/favourite_data.dart';
import 'package:health_app/data/model/commentmodel.dart';
import 'package:health_app/data/model/doctormodel.dart';

class DoctordetailsController extends GetxController {
  Doctormodel? doctormodel;
  StatusRequest statusRequest = StatusRequest.none;
  FavouriteData favouriteData = FavouriteData(Get.find());
  MyServices myServices = Get.find();
  bool isFavourite = false;
  FavouriteController controller = Get.find();
  List<CommentModel> list = [];
  CommentData commentData = CommentData(Get.find());

  Map DataDoctorDetails = {
    "Patients": "56",
    "Expereiences": "9",
    "Rating": "4.0",
  };

  // Save favorite status in shared preferences
  Future<void> saveFavouriteStatus(String doctorId, bool status) async {
    await myServices.sharedPreferences.setBool("favourite_$doctorId", status);
  }

  // Load favorite status from shared preferences
  loadFavouriteStatus(String doctorId) {
    isFavourite =
        myServices.sharedPreferences.getBool("favourite_$doctorId") ?? false;
    return isFavourite;
  }

  makeitFavourite(String doctorid) async {
    isFavourite = !isFavourite;
    update();

    await saveFavouriteStatus(doctorid, isFavourite);

    if (isFavourite) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await favouriteData.addFavourite(
          myServices.sharedPreferences.getString("id")!, doctorid);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          controller.getData();
          Get.defaultDialog(
              title: "Success",
              titleStyle: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              middleText: "This Doctor has been added to Favourite",
              middleTextStyle: TextStyle(fontSize: 16));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await favouriteData.deleteFavourite(
          myServices.sharedPreferences.getString("id")!, doctorid);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          controller.getData();
          Get.defaultDialog(
              title: "Success",
              titleStyle: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              middleText: "This Doctor has been removed from Favourite",
              middleTextStyle: TextStyle(fontSize: 16));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    }
  }

  void goToBookAppointements() {
    Get.toNamed(AppRoutes.appoitementsSchedule,
        arguments: {"doctormodel": doctormodel});
  }

  loadComment(String doctorid) async {
    statusRequest = StatusRequest.loading;
    update();
    list.clear();
    var response = await commentData.load(doctorid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list = data.map((e) => CommentModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  goToComment() {
    Get.toNamed(AppRoutes.comment);
  }

  @override
  void onInit() {
    doctormodel = Get.arguments["doctormodel"];
    if (doctormodel != null) {
      loadFavouriteStatus(
          doctormodel!.doctorId.toString()); // Load the favorite status
    }
    loadComment(doctormodel!.doctorId.toString());
    super.onInit();
  }
}
