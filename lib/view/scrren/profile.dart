import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/profile_controller.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/imageassets.dart';
import 'package:health_app/view/widget/profile/customname.dart';
import 'package:health_app/view/widget/profile/parametere.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(
        builder: (controller) => Scaffold(
              body: Container(
                color: AppColor.white,
                child: Stack(
                  children: [
                    // Background container with primary color
                    Container(
                      color: AppColor.primaycolor,
                      height: 300,
                    ),
                    // Profile content with ListView
                    ListView(
                      children: [
                        SizedBox(
                            height: 40), // Space for the background container
                        Center(
                          child: Container(
                            height: 130,
                            child: ClipOval(
                              child: Image.asset(AppImageassets.profile),
                            ),
                          ),
                        ),
                        Customname(ageandgendor: "22 years old | Male" ,username: "Zayoud Raed",),
                        SizedBox(
                          height: 70,
                        ),
                        Parametere(),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
