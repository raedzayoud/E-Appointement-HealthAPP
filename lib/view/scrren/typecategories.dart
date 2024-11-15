import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/typecategories_controller.dart';
import 'package:health_app/core/class/handalingdataview.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/linkapi.dart';

class Typecategories extends StatelessWidget {
  const Typecategories({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    TypecategoriesController controller = Get.put(TypecategoriesController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaycolor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.name,
              style: TextStyle(color: AppColor.white),
            ),
            if (controller.icon != null) ...[
              SizedBox(width: 5),
              Icon(
                controller.icon,
                color: AppColor.white,
              ),
            ],
          ],
        ),
        centerTitle: true,
      ),
      body: GetBuilder<TypecategoriesController>(
        builder: (controller) {
          return HandlingdataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                final doctor = controller.list[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(doctor.doctorUsername ?? "Unknown Doctor"),
                    subtitle: Text(doctor.doctorType ?? "Specialty not specified"),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("${AppLinkApi.imagesdoctor}/${doctor.doctorImage}"  ?? ""),
                      onBackgroundImageError: (error, stackTrace) {
                        // Fallback image in case of an error
                       // return Icon(Icons.person, size: 40);
                      },
                    ),
                    onTap: () {
                      // Add any additional action on tap
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
