import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/profile_controller.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/imageassets.dart';

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
                      height: 300,
                      color: AppColor.primaycolor,
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
                        Container(
                          color: AppColor.primaycolor,
                          child: ListTile(
                            title: Center(
                              child: Text(
                                "Zayoud Raed",
                                style: TextStyle(
                                    color: AppColor.white, fontSize: 18),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                "22 years old | Male",
                                style: TextStyle(
                                    color: AppColor.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          height: 250,
                          child: Card(
                            color: AppColor.white,
                            child: ListView(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                Divider(
                                  thickness: 0.5,
                                ),
                                ...controller.mp.entries.map((entry) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      children: [
                                        Icon(entry.value,
                                            color: AppColor.primaycolor),
                                        SizedBox(
                                            width:
                                                10), // Add space between icon and text
                                        Text(
                                          entry.key,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
