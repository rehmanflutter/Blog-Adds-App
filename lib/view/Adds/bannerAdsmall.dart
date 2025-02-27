import 'package:adds/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

class BannerAdSmall extends StatefulWidget {
  @override
  State<BannerAdSmall> createState() => _BannerAdSmallState();
}

class _BannerAdSmallState extends State<BannerAdSmall> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.loadGoogleAd();
  }

  // void loadGoogleAd() async {
  //   googleBannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: Platform.isAndroid
  //         ? controller.bannerAddId //controller.settingModel!.googleBannerAdId
  //         : "ca-app-pub-3940256099942544/2934735716",
  //     listener: BannerAdListener(),
  //     request: const AdRequest(),
  //   );
  //   await googleBannerAd!.load();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: controller.googleBannerAd != null
          ? AdWidget(ad: controller.googleBannerAd!)
          : Container(),
    );
  }
}
