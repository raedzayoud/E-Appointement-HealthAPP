import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/appoitements_controller.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/imageassets.dart';

class Completedappointement extends GetView<AppoitementsController> {
  const Completedappointement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 250,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.black),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 100, child: Image.asset(AppImageassets.doctor1)),
              Expanded(
                  child: ListTile(
                title: Text(
                  "Zayoud Raed",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Cardio"),
              ))
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ${controller.dayOfWeek}  ${controller.formattedDate}",
                  style: TextStyle(
                      color: AppColor.primaycolor, fontWeight: FontWeight.bold),
                ),
                // Spacer(),
                Container(
                  child: Text(
                    "${controller.currentTime}",
                    style: TextStyle(
                        color: AppColor.primaycolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: AppColor.primaycolor,
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(bottom: 20),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Give us Your FeedBack of the doctor",
                style: TextStyle(color: AppColor.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}