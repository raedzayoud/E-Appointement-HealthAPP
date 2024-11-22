import 'package:get/get.dart';
import 'package:health_app/controller/favourite_controller.dart';
import 'package:health_app/core/class/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(FavouriteController());
  }
}
