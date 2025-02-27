import 'package:adds/controller/home_controller.dart';
import 'package:adds/custom/Extension/extension.dart';
import 'package:adds/custom/app_color.dart';
import 'package:adds/custom/app_text.dart';
import 'package:adds/custom/custamContainer.dart';
import 'package:adds/view/Adds/bannerAdsmall.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewPage extends StatelessWidget {
  ViewPage({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              6.h.height,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  5.w.width,
                  CustomTextWidget(
                    maxLines: 1,
                    title: controller.homeList[controller.selectIndex].title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              2.h.height,
              BannerAdSmall(),
              2.h.height,
              CustomContainer(
                cir: 10,
                height: 30.h,
                width: double.infinity,
                imageDecoration: DecorationImage(
                    image: AssetImage(
                      controller.homeList[controller.selectIndex].images,
                    ),
                    fit: BoxFit.cover),
              ),
              2.h.height,
              BannerAdSmall(),
              3.h.height,
              CustomTextWidget(
                title: controller.homeList[controller.selectIndex].description,
                fontSize: 18.sp,
              ),
              2.h.height,
              BannerAdSmall(),
              2.h.height,
              CustomTextWidget(
                title: controller.homeList[0].description,
              ),
              7.h.height
            ],
          ),
        ),
      ),
    );
  }
}
