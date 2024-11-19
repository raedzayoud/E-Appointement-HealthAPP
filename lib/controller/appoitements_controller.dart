import 'package:get/get.dart';
import 'package:health_app/core/class/statusrequest.dart';
import 'package:health_app/core/function/handledata.dart';
import 'package:health_app/core/services/services.dart';
import 'package:health_app/data/datasource/remote/appointement_data.dart';
import 'package:health_app/data/model/appointementmodel.dart';
import 'package:intl/intl.dart';

class AppoitementsController extends GetxController {
  String type = "Upcoming";
  String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
  String currentTime = DateFormat('hh:mm a').format(DateTime.now());
  StatusRequest statusRequest = StatusRequest.none;
  AppointementData appointementData = AppointementData(Get.find());
  MyServices myServices = Get.find();
  List<appointementmodel> list = [];

  void clickonthis(String val) {
    type = val;
    update();
  }

  void LoadDataUpcoming() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await appointementData
        .view(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list = data.map((e) => appointementmodel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    LoadDataUpcoming();
    super.onInit();
  }
}
