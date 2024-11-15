import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/core/constant/color.dart';

class Customappar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final bool isAction;

  const Customappar({
    super.key,
    required this.name,
    this.isAction = false, // Default to no actions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColor.white,
        ),
      ),
      backgroundColor: AppColor.primaycolor,
      title: Text(
        name,
        style: TextStyle(color: AppColor.white),
      ),
      centerTitle: true,
      actions: isAction
          ? [
              IconButton(
                icon: Icon(Icons.favorite_outline, color: AppColor.white),
                onPressed: () {
                  // Handle action button tap
                },
              ),
            ]
          : null, // No actions if isAction is false
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
