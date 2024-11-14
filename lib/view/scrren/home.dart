import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/home_controller.dart';
import 'package:health_app/core/constant/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text(
            "Zayoud Raed ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ],
        ),
        body: Container(
          color: AppColor.white,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                "Search for your favourite doctor",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  hintText: 'Search for your doctor',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a search term';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.mp.length,
                  itemBuilder: (context, index) {
                    String category = controller.mp.keys.elementAt(index);
                    IconData icon = controller.mp[category]!;
                    return Container(
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
                            style:
                                TextStyle(fontSize: 14, color: AppColor.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Appointments Today",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350],
                ),
                height: 50,
                width: double.infinity,
                child: Center(child: Text("No Appointments Today")),
              ),
              SizedBox(height: 10),
              Text(
                "Top Doctor",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(height: 10),
              ...List.generate(controller.TopdataDoctor.length, (index) {
                return InkWell(
                  onTap: () {
                    controller.goToDoctorDetails(
                        controller.TopdataDoctor[index]['image'],
                        controller.TopdataDoctor[index]['name'],
                        controller.TopdataDoctor[index]['type']);
                  },
                  child: Card(
                    color: AppColor.white,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            controller.TopdataDoctor[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                controller.TopdataDoctor[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle:
                                  Text(controller.TopdataDoctor[index]['type']),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )),
                                Text(
                                    "Reviews (${controller.TopdataDoctor[index]['Review']}) ")
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
