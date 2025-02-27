import 'package:adds/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// test id

// <meta-data
//             android:name="com.google.android.gms.ads.APPLICATION_ID"
//             android:value="ca-app-pub-3940256099942544~3347511713"/>

//
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent));
      return MaterialApp(
        title: 'Blog App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplishScreen(),
      );
    });
  }
}
