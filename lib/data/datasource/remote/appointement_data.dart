import 'package:health_app/core/class/crud.dart';
import 'package:health_app/linkapi.dart';

class AppointementData {
  Crud crud;

  AppointementData(this.crud);

  add(String userid, String doctorid, DateTime date,
      String appointement_heure) async {
    var response = await crud.postData(AppLinkApi.addappointement, {
      "userid": userid,
      "doctorid": doctorid,
      "date": date.toString(),
      "appointement_heure":appointement_heure
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }
  
  view(String userid) async {
    var response = await crud.postData(AppLinkApi.viewappointement, {
      "userid": userid,
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

}
