import 'package:flutter/material.dart';
import 'package:health_app/core/constant/color.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Doctors",style: TextStyle(color: AppColor.white),),
        centerTitle: true,
        backgroundColor: AppColor.primaycolor,
      ),
    );
  }
}