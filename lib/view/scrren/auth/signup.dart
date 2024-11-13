import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/core/function/validinput.dart';
import 'package:health_app/view/widget/auth/curstomtextformauth.dart';
import 'package:health_app/view/widget/auth/custombuttonauth.dart';
import 'package:health_app/view/widget/auth/logoauth.dart';
import '../../widget/auth/customtextsignup.dart';
class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 118, 233, 128), // Start color (soft green)
              Color.fromARGB(255, 255, 255, 255), // Middle color (light)
              Color.fromARGB(255, 195, 235, 200), // End color (pastel green)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 0.6, 1.0],
          )),
          padding: EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Form(
            // key: controllerImp.formstate,
            child: ListView(
              children: [
                // Container(
                // height: 200,
                // child: Image.asset(AppImageassets.signuphealth)),
                Logoauth(),
                SizedBox(
                  height: 30,
                ),
                Curstomtextformauth(
                  validator: (val) {
                    return validinput(val!, 2, 100, "password");
                  },
                  hintText: "Enter Your Username",
                  iconData: Icons.person_outline,
                  label: "Username",
                  //  mycontroller: controllerImp.username,
                ),
                Curstomtextformauth(
                  validator: (val) {
                    return validinput(val!, 5, 30, "email");
                  },
                  hintText: "Enter Your Email",
                  iconData: Icons.email_outlined,
                  label: "Email",
                  //  mycontroller: controllerImp.email,
                ),
                Curstomtextformauth(
                  validator: (val) {
                    return validinput(val!, 5, 11, "phone");
                  },
                  hintText: "Enter Your Phone",
                  iconData: Icons.phone,
                  label: "Phone",
                  //  mycontroller: controllerImp.phone,
                  type: TextInputType.number,
                ),
                Curstomtextformauth(
                  validator: (val) {
                    return validinput(val!, 2, 100, "age");
                  },
                  hintText: "Enter Your Age",
                  iconData: Icons.date_range,
                  label: "Age",
                  //  mycontroller: controllerImp.age,
                  type: TextInputType.number,
                ),
                Curstomtextformauth(
                  validator: (val) {
                    return validinput(val!, 4, 100, "password");
                  },
                  hintText: "Enter Your Password",
                  iconData: Icons.lock_outline,
                  label: "Password",
                  //  mycontroller: controllerImp.password,
                ),
              
                Custombuttonauth(
                  content: "Choose Image",
                  onPressed: () {
                    // controllerImp.Signup();
                  },
                ),
                
                Container(
                  child: Custombuttonauth(
                    content: "Sign Up",
                    onPressed: () {
                      // controllerImp.Signup();
                    },
                  ),
                ),
                SizedBox(height: 15,),
                Customtextsignup(
                  textone: "Have an account ? ",
                  textwo: "Sign In ",
                  onTap: () {
                    //   controllerImp.goToLogin();
                    Get.offAllNamed(AppRoutes.login);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
