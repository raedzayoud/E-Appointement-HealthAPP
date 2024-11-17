import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/home_controller.dart';
import 'package:health_app/core/class/handalingdataview.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/imageassets.dart';
import 'package:health_app/linkapi.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:health_app/view/widget/home/customtextformfieldsearch.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
        builder: (controller) => HandlingdataRequest(
              statusRequest: controller.statusRequest,
              widget: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColor.white,
                  title: Container(
                    height: 150,
                    width: 150,
                    child: Transform.scale(
                        scale: 1.5,
                        child: ClipOval(
                            child: Image.asset(AppImageassets.secondlogo))),
                  ),
                  centerTitle: true,
                ),
                body: Container(
                  color: AppColor.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Search for your favourite doctor",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      SizedBox(height: 10),
                      Customtextformfieldsearch(
                        hintText: "Search for your doctor",
                        iconData: Icons.search,
                        onPressed: () {},
                        validator: (value) {},
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.mp.length,
                          itemBuilder: (context, index) {
                            String category =
                                controller.mp.keys.elementAt(index);
                            IconData icon = controller.mp[category]!;
                            return InkWell(
                              onTap: () {
                                controller.goToCategoriesDetails(
                                    category, icon);
                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: AppColor.primaycolor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Icon(icon, size: 30, color: AppColor.white),
                                    SizedBox(width: 8),
                                    Text(
                                      category,
                                      style: TextStyle(
                                          fontSize: 14, color: AppColor.white),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Top Doctor",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      SizedBox(height: 10),
                      ...List.generate(controller.TopdataDoctor.length,
                          (index) {
                        final doctor = controller.TopdataDoctor[index];
                        return InkWell(
                          onTap: () {
                            controller.goToDoctorDetails(
                              "${AppLinkApi.imagesdoctor}/${doctor.doctorImage!}",
                              doctor.doctorUsername!,
                              doctor.doctorType!,
                            );
                          },
                          child: Card(
                            color: AppColor.white,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: 'doctorImage_${doctor.doctorUsername}',
                                  child: Container(
                                      height: 150,
                                      width: 120,
                                      padding: EdgeInsets.all(8),
                                      child: HashCachedImage(
                                        imageUrl:
                                            "${AppLinkApi.imagesdoctor}/${doctor.doctorImage}",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          "Dr." + doctor.doctorUsername!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(doctor.doctorType!),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Icon(Icons.star,
                                                color: Colors.yellow),
                                          ),
                                          Text(
                                              "Reviews (${doctor.doctorReview})"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ));
  }
}
