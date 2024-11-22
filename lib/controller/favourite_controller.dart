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
 
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    list.clear();
    var response = await favouriteData
        .viewFavourite(myServices.sharedPreferences.getString("id")!);
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

}
