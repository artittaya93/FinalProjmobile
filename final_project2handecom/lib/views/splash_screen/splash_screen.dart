
// ignore_for_file: unnecessary_import, implementation_imports, unused_import

import 'package:final_project2handecom/consts/colors.dart';
import 'package:final_project2handecom/consts/consts.dart';
import 'package:final_project2handecom/views/auth_screen/login_screen.dart';
import 'package:final_project2handecom/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}): super(key: key);

  @override
  State<SplashScreen> createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //creating method to change screen

  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      //using get x
      Get.to(() => const LoginScreen());

    });
  }

@override
  void initState() {
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      body: Center(child: Column(
        children: [
          Align(
          alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)), 
          20.heightBox,
          applogoWidget(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          5.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          30.heightBox,
          //Our splash UI screen complete
        ],
      ),
      ),
    );
  }
}