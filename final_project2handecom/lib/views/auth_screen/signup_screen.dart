import 'package:final_project2handecom/consts/consts.dart';
import 'package:final_project2handecom/controllers/auth_controller.dart';
import 'package:final_project2handecom/views/home_screen/home.dart';
import 'package:final_project2handecom/widgets_common/applogo_widget.dart';
import 'package:final_project2handecom/widgets_common/bg_widget.dart';
import 'package:final_project2handecom/widgets_common/custom_textfeild.dart';
import 'package:final_project2handecom/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}): super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child:  Scaffold( 
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column( 
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join the  to $appname".text.fontFamily(bold).black.size(18).make(),
            15.heightBox,

            Column(
              children: [
                customTextFeild(hint: nameHint, title: name, controller: nameController, isPass: false),
                customTextFeild(hint: emailHint, title: email, controller: emailController, isPass: false),
                customTextFeild(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                customTextFeild(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, isPass: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: mainGreen,
                        value: isCheck, 
                        onChanged: (newValue){
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                        10.heightBox,
                        Expanded(child:RichText(text: const TextSpan(
                          children: [
                            TextSpan(text: "I agree tp the ", style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                            TextSpan(text: termAndCond, style: TextStyle(
                              fontFamily: regular,
                              color: mainGreen,
                            )),
                            TextSpan(text: "&", style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                            TextSpan(text: privacyPolicy, style: TextStyle(
                              fontFamily: regular,
                              color: mainGreen,
                            )),
                          ]
                           )),
                  )],
                  ),
                   5.heightBox,
                  ourButton(color: isCheck == true? mainGreen : lightGrey, title: signup, textColor: whiteColor, onPress: () async {
                    if(isCheck !=false){
                      try {
                        await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                          return controller.storeUSerData(email: emailController.text, password: passwordController.text,name: nameController.text);
                        }).then((value){
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(() => const Home());
                        });
                      } catch (e) {
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                      }
                    }
                  },
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  RichText(text: const TextSpan(
                    children:[
                      TextSpan(
                      text: alreadyHaveAccount,
                      style: TextStyle(
                        fontFamily: bold,
                        color: fontGrey,
                      ),
                    ),
                    TextSpan(
                      text: login,
                      style: TextStyle(
                        fontFamily: bold,
                        color: mainGreen,
                      ),
                    ),
              ])).onTap(() {
                Get.back();
              }),
              ],
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make()
          ]),
      ),
      ));
  }
}