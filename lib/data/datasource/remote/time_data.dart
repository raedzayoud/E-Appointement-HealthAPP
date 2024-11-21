import 'dart:io';

import 'package:health_app/core/class/crud.dart';
import 'package:health_app/linkapi.dart';

class TimeData {
  Crud crud;

  TimeData(this.crud);

  manageTime(String doctorid, String appointementdate) async {
    var response = await crud.postData(AppLinkApi.timemanager,
        {"doctorid": doctorid, "appointementdate": appointementdate});

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
