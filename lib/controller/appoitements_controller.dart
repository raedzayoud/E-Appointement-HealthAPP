import 'package:get/get.dart';
import 'package:health_app/core/class/statusrequest.dart';
import 'package:intl/intl.dart';

class AppoitementsController extends GetxController{
   
  String type="Upcoming";
  String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
  String currentTime = DateFormat('hh:mm a').format(DateTime.now()); 
  StatusRequest statusRequest = StatusRequest.none;

   void clickonthis(String val){
    type=val;
    update();
   }

}