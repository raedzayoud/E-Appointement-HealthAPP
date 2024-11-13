import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/core/constant/routes.dart';
import 'package:health_app/core/function/validinput.dart';
import 'package:health_app/view/widget/auth/curstomtextformauth.dart';
import 'package:health_app/view/widget/auth/custombuttonauth.dart';
import 'package:health_app/view/widget/auth/customsigninwithinternet.dart';
import 'package:health_app/view/widget/auth/customtextbodyauth.dart';
import 'package:health_app/view/widget/auth/customtexttitleauth.dart';
import 'package:health_app/view/widget/auth/logoauth.dart';
import '../../widget/auth/customtextsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    //  Get.put(LoginControlllerImp());
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
          )), // Control the transition points
      
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          child: Form(
            //  key: controlllerImp.formstate,
            child: ListView(
              children: [
                Logoauth(),
               
                // Customtexttitleauth(
                //   title: "Welcome Back",
                // ),
              //  SizedBox(height: 20,),
                Customtextbodyauth(
                  body:
                      "Our Platform offers the best booking system to enable you save time ",
                ),
                SizedBox(
                  height: 10,
                ),
                Curstomtextformauth(
                  hintText: "Enter Your Email",
                  iconData: Icons.email_outlined,
                  label: "Email",
                  // mycontroller: controlllerImp.email,
                  validator: (val) {
                    return validinput(val!, 5, 100, "email");
                  },
                ),
                // GetBuilder<LoginControlllerImp>(
                //   builder: (controlllerImp) =>
                Curstomtextformauth(
                  //   obscturetext: controlllerImp.isshowpassword,
                  hintText: "Enter Your Password",
                  iconData: Icons.visibility_off_outlined,
                  label: "Password",
                  //    mycontroller: controlllerImp.password,
                  validator: (val) {
                    return validinput(val!, 4, 100, "password");
                  },
                  onTapIcon: () {
                    //  controlllerImp.showpassword();
                  },
                ),

                InkWell(
                  onTap: () {
                    //  controlllerImp.goToForgetPassword();
                  },
                  child: Text(
                    "Forget Password ?",
                    textAlign: TextAlign.end,
                  ),
                ),
                
                SizedBox(height: 10,),
                Custombuttonauth(
                  content: "Sign In",
                  onPressed: () {
                    //    controlllerImp.Login();
                    Get.offAllNamed(AppRoutes.homescrren);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Customsigninwithinternet(),
                SizedBox(
                  height: 17,
                ),
                Customtextsignup(
                  textone: "Don't have an account ? ",
                  textwo: "Sign up ",
                  onTap: () {
                    // controlllerImp.goToSignup();
                    Get.offAllNamed(AppRoutes.singup);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
