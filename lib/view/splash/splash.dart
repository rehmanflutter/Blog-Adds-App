import 'dart:async';
import 'package:adds/controller/home_controller.dart';
import 'package:adds/custom/app_color.dart';
import 'package:adds/custom/app_images.dart';
import 'package:adds/view/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplishScreen extends StatefulWidget {
  @override
  State<SplishScreen> createState() => _SplishScreenState();
}

class _SplishScreenState extends State<SplishScreen> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    // controller.loadGoogleAd();
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      initializeAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(AppImages.frame2)),
          SvgPicture.asset(AppImages.frame),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppImages.frame1)),
        ],
      ),
    );
  }

  void initializeAds() async {
    await MobileAds.instance.initialize();
  }
}
