import 'package:final_project2handecom/consts/lists.dart';
import 'package:final_project2handecom/controllers/auth_controller.dart';
import 'package:final_project2handecom/views/auth_screen/login_screen.dart';
import 'package:final_project2handecom/views/profile_screen/components/details_card.dart';
import 'package:final_project2handecom/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_project2handecom/consts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [

              //edit profile button
              const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.edit, color: whiteColor)).onTap(() {},),


              //users details section



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  Image.asset(imgProfile2, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).black.make(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: "customer@example.com".text.black.make(),
                      ),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: dark
                      )
                    ),
                    onPressed: () async {
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.off(() => const LoginScreen());
                    }, child: logout.text.fontFamily(semibold).black.make(),)
                ],),
              ),

              20.heightBox,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(count: "00", title: "in your cart", width: context.screenWidth / 3.4),
                detailsCard(count: "32", title: "in your wishlist", width: context.screenWidth / 3.4),
                detailsCard(count: "675", title: "in your orders", width: context.screenWidth / 3.4),
              ],
             ),

             //buttons section
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const Divider(color: lightGrey);
              },
              itemCount: profileButtonLists.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: Image.asset(profileButtonIcon[index],
                  width: 22),
                  title: profileButtonLists[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                );
              },
            ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(mainGreen).make(),



          ]),

      ),
      ),
    );
  }
}