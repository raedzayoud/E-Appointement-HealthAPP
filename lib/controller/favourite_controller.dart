import 'package:get/get.dart';
import 'package:health_app/core/class/statusrequest.dart';
import 'package:health_app/core/function/handledata.dart';
import 'package:health_app/core/services/services.dart';
import 'package:health_app/data/datasource/remote/favourite_data.dart';
import 'package:health_app/data/model/favouritemodel.dart';

class FavouriteController extends GetxController {
  FavouriteData favouriteData = FavouriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<FavouriteModel> list = [];
  MyServices myServices = Get.find();

  Map isfavorite = {};

  setFavoutite(id, val) {
    isfavorite[id] = val;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    list.clear();
    var userId = myServices.sharedPreferences.getString("id");
    if (userId == null) {
      // Handle the case where the ID is not set
      print("User ID not found in SharedPreferences.");
      return; // Or provide a fallback value or action
    }

    var response = await favouriteData.viewFavourite(userId);

    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list = data.map((e) => FavouriteModel.fromJson(e)).toList();
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
