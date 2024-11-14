import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/doctordetails_controller.dart';
import 'package:health_app/core/constant/color.dart';

class Doctordetails extends StatelessWidget {
  const Doctordetails({super.key});

  @override
  Widget build(BuildContext context) {
    DoctordetailsController controller = Get.put(DoctordetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Doctors Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        //backgroundColor: AppColor.primaycolor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: AppColor.red,
              ))
        ],
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
            Center(
              child: Container(
                //color: Colors.red,
                height: 150,
                child: Transform.scale(
                    scale: 1.4,
                    child: ClipOval(child: Image.asset(controller.urlImage))),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              "Dr.${controller.name}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.secondcolor,
                    ),
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Patient",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("56", style: TextStyle(color: AppColor.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.secondcolor,
                    ),
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Expereicnes",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("9 Years",
                              style: TextStyle(color: AppColor.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.secondcolor,
                    ),
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Rating ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "4.0",
                            style: TextStyle(color: AppColor.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                "I am ${controller.type} Specialist",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.secondcolor,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                      child: Text(
                        "Book Appointements",
                        style: TextStyle(
                            color: AppColor.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {})),
            )
          ],
        ),
      ),
    );
  }
}
