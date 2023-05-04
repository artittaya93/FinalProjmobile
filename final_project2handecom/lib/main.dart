// ignore_for_file: unused_import
import 'package:final_project2handecom/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'consts/consts.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //we are using getX so we have to change this material app into getmaterialapp
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2nd Store',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          //to set app bar icons color
          iconTheme: IconThemeData(color: darkFontGrey),

          //set elevation to 0
          elevation: 0.0,
          backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}


