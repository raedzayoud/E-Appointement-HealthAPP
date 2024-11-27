import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/doctordetails_controller.dart';
import 'package:health_app/controller/favourite_controller.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/linkapi.dart';
import 'package:health_app/view/widget/appointementdoctor/customappar.dart';
import 'package:health_app/view/widget/doctordetails/custombutton.dart';
import 'package:health_app/view/widget/doctordetails/custominfodoctor.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Doctordetails extends StatelessWidget {
  const Doctordetails({super.key});

  @override
  Widget build(BuildContext context) {
    DoctordetailsController controller = Get.put(DoctordetailsController());
    
    return Scaffold(
      appBar: Customappar(
        name: "Doctor Details",
        isAction: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: 'doctorImage_${controller.doctormodel!.doctorUsername}',
              child: Center(
                child: Container(
                  //color: Colors.red,
                  height: 150,
                  child: Transform.scale(
                      scale: 1.4,
                      child: ClipOval(
                          child: HashCachedImage(
                        imageUrl:
                            "${AppLinkApi.imagesdoctor}/${controller.doctormodel!.doctorImage!}",
                      ))),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              "Dr.${controller.doctormodel!.doctorUsername!}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custominfodoctor(
                  name: "Patient",
                  nbre: "56",
                ),
                Custominfodoctor(
                  name: "Expereicnes",
                  nbre: "9 Years",
                ),
                Custominfodoctor(
                  name: "Rating",
                  nbre: "4.0",
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "About Doctor",
                  style: TextStyle(
                      color: AppColor.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "I am ${controller.doctormodel!.doctorType} Specialist",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            Custombutton(
              text: "View comments from other clients ",
              onPressed: () {
                controller.goToComment();
              },
            ),
            Custombutton(
              text: "Book Appointements",
              onPressed: () {
                controller.goToBookAppointements();
              },
            )
          ],
        ),
      ),
    );
  }
}
