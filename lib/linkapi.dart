class AppLinkApi {
  static String linkServeurName = "http://192.168.130.117/health";
  //

  //===================================Image===================================//

  static String imagesdoctor = "$linkServeurName/upload/doctor";
  static String imagesuser = "$linkServeurName/upload/users";
  // doctor
  static String viewdoctor = "$linkServeurName/doctor/viewdoctorbyreview.php";
  static String filtragebyspec =
      "$linkServeurName/doctor/filtragebyspeacilte.php";

  //signup
  static String signup = "$linkServeurName/auth/signup.php";
  static String login = "$linkServeurName/auth/login.php";

  //appointement

  static String addappointement = "$linkServeurName/appointement/add.php";
  static String viewappointement =
      "$linkServeurName/appointement/viewupcoming.php";
  static String cancelledapp = "$linkServeurName/appointement/cancelledapp.php";
  static String viewcancelled =
      "$linkServeurName/appointement/viewcancelled.php";
  static String completedapp = "$linkServeurName/appointement/completedapp.php";
}
