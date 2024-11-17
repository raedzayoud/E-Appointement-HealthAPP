import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/controller/appoitementsdoctor_controller.dart';
import 'package:health_app/core/constant/color.dart';
import 'package:health_app/view/widget/appointementdoctor/customappar.dart';
import 'package:table_calendar/table_calendar.dart';

class Appointementsdoctor extends StatelessWidget {
  const Appointementsdoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppoitementsdoctorController());
    return GetBuilder<AppoitementsdoctorController>(
        builder: (controller) => Scaffold(
              appBar: Customappar(
                name: "Appointement",
              ),
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Calendar Widget
                    TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: controller.focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(controller.selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        controller.onDaySelected(selectedDay, focusedDay);
                      },
                      enabledDayPredicate: (day) {
                        return day.isAfter(
                            DateTime.now().subtract(Duration(days: 1)));
                      },
                      calendarFormat: CalendarFormat.month,
                      calendarBuilders: CalendarBuilders(
                        selectedBuilder: (context, date, _) {
                          //reduce the size
                          return Container(
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${date.day}',
                              style:
                                  TextStyle(color: Colors.white), // Text color
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                    if (controller.selectedDay.weekday == DateTime.saturday ||
                        controller.selectedDay.weekday == DateTime.sunday) ...[
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 200,
                          child: Text(
                            "There are no appointments on these days",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Select Consultation Time',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: controller.timeSlots.map((time) {
                          return ChoiceChip(
                            label: Text(time),
                            selected: controller.selectedTime == time,
                            onSelected: (selected) {
                              controller.onTimeSelected(time);
                            },
                          );
                        }).toList(),
                      ),
                      Spacer(),
                      // Make Appointment Button
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.primaycolor,
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          onPressed: () {
                            controller.MakeAppointement();
                          },
                          child: Text(
                            'Make Appointment',
                            style: TextStyle(color: AppColor.white),
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ));
  }
}
