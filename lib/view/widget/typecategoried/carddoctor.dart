import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:health_app/controller/home_controller.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/data/model/doctormodel.dart';
import 'package:health_app/linkapi.dart';

class Carddoctor extends GetView<HomeController> {
  final Doctormodel doctor;
  const Carddoctor({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToDoctorDetails(
            "${AppLinkApi.imagesdoctor}/${doctor.doctorImage!}",
            doctor.doctorUsername!,
            doctor.doctorType!);
      },
      child: Container(
        height: 150,
        child: Card(
          color: AppColor.white,
          margin: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items at the top
            children: [
              Container(
                height: 130,
                width: 130,
                child: HashCachedImage(
                  imageUrl: "${AppLinkApi.imagesdoctor}/${doctor.doctorImage}",
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctor.doctorUsername ?? "Unknown Doctor",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      doctor.doctorType ?? "Specialty not specified",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      //  overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
