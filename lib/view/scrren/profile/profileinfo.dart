import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/core/constant/imageassets.dart';

class Profileinfo extends StatelessWidget {
  const Profileinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: AppColor.white, fontSize: 25),
          
        ),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: AppColor.white,)),
        centerTitle: true,
        backgroundColor: AppColor.primaycolor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: 150,
                width: 150,
                child: Image.asset(AppImageassets.profile)),
            SizedBox(
              height: 60,
            ),
            Text(
              "Zayoud Raed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email : "),
                    Text("raed.zayoud.23@gmail.com")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Telephone : "), Text("+216 27740388")],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Age : "), Text("20 years old")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
