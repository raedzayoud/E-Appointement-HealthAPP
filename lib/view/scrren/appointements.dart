import 'package:flutter/material.dart';
import 'package:health_app/core/constant/color.dart';

class Appointements extends StatelessWidget {
  const Appointements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Appointements Schedule ",style: TextStyle(color: AppColor.white),),
        centerTitle: true,
        backgroundColor: AppColor.primaycolor,
      ),
    );
  }
}