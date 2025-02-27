import 'package:adds/custom/app_images.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

class HomeController extends GetxController {
  int selectIndex = 0;
  String bannerAddId = //"ca-app-pub-3923934055849118/1403822831";
      "ca-app-pub-3940256099942544/6300978111";
  String videoAddId = "ca-app-pub-3940256099942544/5224354917";

  // BannerAd? googleBannerAd;
  // void loadGoogleAd() async {
  //   googleBannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: Platform.isAndroid
  //         ? bannerAddId //controller.settingModel!.googleBannerAdId
  //         : bannerAddId,
  //     listener: BannerAdListener(),
  //     request: const AdRequest(),
  //   );
  //   await googleBannerAd!.load();
  // }

  BannerAd? googleBannerAd;

  void loadGoogleAd() {
    googleBannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: Platform.isAndroid
          ? bannerAddId // Ensure this ID is correct and not a test ID
          : bannerAddId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("Banner Ad Loaded Successfully");
        },
        onAdFailedToLoad: (ad, error) {
          print("Banner Ad Failed to Load: ${error.message}");
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );

    googleBannerAd!.load();
  }

/////
  ///
  ///
  List<HomeModel> homeList = [
    HomeModel(
        title: 'Diary Entry: What to Expect?',
        description:
            'A Diary is a journal organized by date where you express your thoughts, feelings, opinions, and plans. So, be as candid as you can. Because this journal is your safe place. If you don’t know where to start, then start by writing about your day, about yourself, and so on…',
        time: '28 Jul 1890',
        status: 'Running',
        images: AppImages.g3),
    HomeModel(
        title: 'Emma – The Midnight Painter',
        description:
            'Emma loved painting but struggled to find inspiration. One night, a storm lit up her small town, and she ran outside with her canvas. The next morning, she woke up to find her stormy painting had gone viral. Art galleries reached out, and Emma finally realized—her best work came when she embraced the chaos.',
        time: '20 Jul 2020',
        status: 'Upcomming',
        images: AppImages.g4),
    HomeModel(
        title: 'Olivia – The Skateboard Dream',
        description:
            'Olivia was the only girl at her local skatepark. Every time she tried a new trick, the boys laughed. One day, she landed a perfect kickflip. The laughter turned to cheers. Soon, she started her own YouTube channel, inspiring other girls to join her at the park.',
        time: '20 Jul 1956',
        status: 'Incomplete',
        images: AppImages.g5),
    HomeModel(
        title: 'Mia – The Surfing Champion',
        description:
            'Mia grew up in California, riding waves since she was five. After a major wipeout during a competition, she almost quit. But the ocean called her back. A year later, she won first place in the national surf championship, proving that falling is just part of the ride.',
        time: '20 Jul 1996',
        status: 'Running',
        images: AppImages.g6),
    // HomeModel(
    //     title: 'Amelia – The Silent Violinist',
    //     description:
    //         'Amelia was shy and never spoke much in school. But when she played the violin, the whole world listened. One day, she performed in a subway station, and a famous music producer happened to walk by. That performance changed her life forever.',
    //     time: '20 Jul 2006',
    //     status: 'Upcomming',
    //     images: AppImages.g1),
    // HomeModel(
    //     title: 'Amelia – The Silent Violinist',
    //     description:
    //         'Amelia was shy and never spoke much in school. But when she played the violin, the whole world listened. One day, she performed in a subway station, and a famous music producer happened to walk by. That performance changed her life forever.',
    //     time: '20 Jul 2006',
    //     status: 'Upcomming',
    //     images: AppImages.g1)
  ];
  //
}

class HomeModel {
  String title;
  String description;
  String time;
  String status;
  String images;
  HomeModel(
      {required this.title,
      required this.description,
      required this.time,
      required this.status,
      required this.images});
}
