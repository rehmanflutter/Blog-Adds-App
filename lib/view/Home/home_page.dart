// import 'dart:io';
// import 'package:adds/controller/home_controller.dart';
// import 'package:adds/custom/Extension/extension.dart';
// import 'package:adds/custom/app_color.dart';
// import 'package:adds/custom/app_images.dart';
// import 'package:adds/custom/app_text.dart';
// import 'package:adds/view/Adds/bannerAdsmall.dart';
// import 'package:adds/view/Home/view_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/instance_manager.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final controller = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         toolbarHeight: 65,
//         backgroundColor: AppColors.primaryColor,
//         automaticallyImplyLeading: false,
//         title: ListTile(
//           leading: CircleAvatar(
//             backgroundImage: AssetImage(AppImages.g1),
//           ),
//           title: CustomTextWidget(
//             title: "Abdul Rehman ",
//             fontSize: 18,
//             color: AppColors.white,
//           ),
//           subtitle: CustomTextWidget(
//             title: "User Name",
//             color: AppColors.lightGray,
//             fontSize: 10,
//           ),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               setState(() {});
//             },
//             child: Icon(
//               Icons.refresh,
//               color: AppColors.white,
//             ),
//           ),
//           10.width,
//           Icon(
//             Icons.filter_alt_rounded,
//             color: AppColors.white,
//           ),
//           20.width,
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 3.w),
//         child: ListView.builder(
//           itemCount: controller.homeList.length,
//           itemBuilder: (context, index) {
//             Color color = controller.homeList[index].status == "Running"
//                 ? AppColors.runningcol
//                 : controller.homeList[index].status == "Upcomming"
//                     ? AppColors.upcommingcol
//                     : controller.homeList[index].status == "Incomplete"
//                         ? AppColors.incompletecol
//                         : AppColors.completedcol;
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 6),
//                   child: GestureDetector(
//                     onTap: () {
//                       controller.selectIndex = index;

//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ViewPage(),
//                           ));
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.shade200,
//                             blurRadius: 2,
//                             spreadRadius: 2,
//                             offset: Offset(2, 2),
//                           ),
//                         ],
//                         color: AppColors.white,
//                         border: Border.all(color: AppColors.lightGray),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding:
//                             const EdgeInsets.only(left: 7, top: 7, bottom: 6),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 4,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                   color: color,
//                                   borderRadius: BorderRadius.circular(10)),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 12),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     width: 82.w,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: 60.w,
//                                           child: Text(
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             controller.homeList[index].title,
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           controller.homeList[index].time,
//                                           style: TextStyle(
//                                             fontSize: 10,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 75.w,
//                                     height: 30,
//                                     child: Text(
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       controller.homeList[index].description,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 80.w,
//                                     child: Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         controller.homeList[index].status,
//                                         style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w500,
//                                           color: color,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 BannerAdSmall()
//               ],
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: RewardedAdContainer(),
//       ),
//     );
//   }
// }

// class RewardedAdContainer extends StatefulWidget {
//   @override
//   _RewardedAdContainerState createState() => _RewardedAdContainerState();
// }

// class _RewardedAdContainerState extends State<RewardedAdContainer> {
//   RewardedAd? _rewardedAd;
//   final controller = Get.put(HomeController());

//   @override
//   void initState() {
//     super.initState();
//     _loadRewardedAd();
//   }

//   void _loadRewardedAd() {
//     RewardedAd.load(
//       adUnitId: Platform.isAndroid
//           ? controller.videoAddId // Test Ad Unit
//           : "ca-app-pub-3940256099942544/1712485313",
//       request: AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (ad) {
//           setState(() {
//             _rewardedAd = ad;
//           });
//         },
//         onAdFailedToLoad: (error) {
//           debugPrint("Failed to load rewarded ad: ${error.message}");
//         },
//       ),
//     );
//   }

//   void _showRewardedAd() {
//     if (_rewardedAd != null) {
//       _rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//           debugPrint("User earned reward: ${reward.amount}");
//         },
//       );

//       _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//         onAdDismissedFullScreenContent: (ad) {
//           ad.dispose();
//           _loadRewardedAd(); // Load a new ad
//         },
//         onAdFailedToShowFullScreenContent: (ad, error) {
//           ad.dispose();
//           _loadRewardedAd();
//         },
//       );
//     } else {
//       debugPrint("Rewarded ad not available yet.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _showRewardedAd,
//       child: Container(
//         height: 50,
//         width: 300,
//         decoration: BoxDecoration(
//           color: Colors.blue, // Background color
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 6,
//               spreadRadius: 2,
//               offset: Offset(2, 2),
//             ),
//           ],
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           "Watch Video Ad",
//           style: TextStyle(
//               color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

// ///
// ///
// ///
// ///
// ///    Auto Show Adds
// ///
// ///
// ///
// ///
// ///
// // class RewardedAdContainer extends StatefulWidget {
// //   @override
// //   _RewardedAdContainerState createState() => _RewardedAdContainerState();
// // }

// // class _RewardedAdContainerState extends State<RewardedAdContainer> {
// //   RewardedAd? _rewardedAd;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadAndShowRewardedAd();
// //   }

// //   void _loadAndShowRewardedAd() {
// //     RewardedAd.load(
// //       adUnitId: Platform.isAndroid
// //           ? controller.videoAddId // Test Ad Unit
// //           : "ca-app-pub-3940256099942544/1712485313",
// //       request: AdRequest(),
// //       rewardedAdLoadCallback: RewardedAdLoadCallback(
// //         onAdLoaded: (ad) {
// //           _rewardedAd = ad;
// //           _showRewardedAd(); // Automatically show the ad
// //         },
// //         onAdFailedToLoad: (error) {
// //           debugPrint("Failed to load rewarded ad: ${error.message}");
// //           Future.delayed(Duration(seconds: 5), _loadAndShowRewardedAd);
// //         },
// //       ),
// //     );
// //   }

// //   void _showRewardedAd() {
// //     if (_rewardedAd != null) {
// //       _rewardedAd!.show(
// //         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
// //           debugPrint("User earned reward: ${reward.amount}");
// //         },
// //       );

// //       _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
// //         onAdDismissedFullScreenContent: (ad) {
// //           ad.dispose();
// //           _loadAndShowRewardedAd(); // Load and show a new ad automatically
// //         },
// //         onAdFailedToShowFullScreenContent: (ad, error) {
// //           ad.dispose();
// //           _loadAndShowRewardedAd();
// //         },
// //       );
// //     } else {
// //       debugPrint("Rewarded ad not available yet.");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 50,
// //       width: 300,
// //       decoration: BoxDecoration(
// //         color: Colors.blue, // Background color
// //         borderRadius: BorderRadius.circular(10),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.2),
// //             blurRadius: 6,
// //             spreadRadius: 2,
// //             offset: Offset(2, 2),
// //           ),
// //         ],
// //       ),
// //       alignment: Alignment.center,
// //       child: Text(
// //         "Video Ad Playing...",
// //         style: TextStyle(
// //             color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   MobileAds.instance.initialize();
// //   runApp(
// //       MaterialApp(home: Scaffold(body: Center(child: RewardedAdContainer()))));
// // }
import 'dart:async';
import 'dart:io';
import 'package:adds/controller/home_controller.dart';
import 'package:adds/custom/Extension/extension.dart';
import 'package:adds/custom/app_color.dart';
import 'package:adds/custom/app_images.dart';
import 'package:adds/custom/app_text.dart';
import 'package:adds/view/Adds/bannerAdsmall.dart';
import 'package:adds/view/Home/view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    setState(() {
      controller.loadGoogleAd();
    }); // Refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundImage: AssetImage(AppImages.g1),
          ),
          title: CustomTextWidget(
            title: "Abdul Rehman 💫",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
          subtitle: CustomTextWidget(
            title: "Watch Ads and Earn Money 🥰🤗",
            color: AppColors.lightGray,
            fontSize: 10,
          ),
        ),
        actions: [
          10.width,
          Icon(
            Icons.filter_alt_rounded,
            color: AppColors.white,
          ),
          20.width,
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.primaryColor,
        color: AppColors.white,
        onRefresh: _refreshData,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: ListView.builder(
            itemCount: controller.homeList.length,
            itemBuilder: (context, index) {
              Color color = controller.homeList[index].status == "Running"
                  ? AppColors.runningcol
                  : controller.homeList[index].status == "Upcomming"
                      ? AppColors.upcommingcol
                      : controller.homeList[index].status == "Incomplete"
                          ? AppColors.incompletecol
                          : AppColors.completedcol;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: GestureDetector(
                      onTap: () {
                        controller.selectIndex = index;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ],
                          color: AppColors.white,
                          border: Border.all(color: AppColors.lightGray),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 7, top: 7, bottom: 6),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 82.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              controller.homeList[index].title,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            controller.homeList[index].time,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 75.w,
                                      height: 30,
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        controller.homeList[index].description,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          controller.homeList[index].status,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: color,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  BannerAdSmall()
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: RewardedAdContainer(),
      ),
    );
  }
}

class RewardedAdContainer extends StatefulWidget {
  @override
  _RewardedAdContainerState createState() => _RewardedAdContainerState();
}

class _RewardedAdContainerState extends State<RewardedAdContainer> {
  RewardedAd? _rewardedAd;
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: Platform.isAndroid
          ? controller.videoAddId // Test Ad Unit
          : "ca-app-pub-3940256099942544/1712485313",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (error) {
          debugPrint("Failed to load rewarded ad: ${error.message}");
        },
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          debugPrint("User earned reward: ${reward.amount}");
        },
      );

      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _loadRewardedAd(); // Load a new ad
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _loadRewardedAd();
        },
      );
    } else {
      debugPrint("Rewarded ad not available yet.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showRewardedAd,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.primaryColor, // Background color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          "Watch Video Ad",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
