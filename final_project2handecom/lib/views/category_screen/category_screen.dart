import 'package:final_project2handecom/consts/lists.dart';
import 'package:final_project2handecom/views/category_screen/category_details.dart';
import 'package:final_project2handecom/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_project2handecom/consts/consts.dart';
import 'package:get/get.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar( 
        title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200 ), itemBuilder: ((context, index) {
            return Column(
              children: [
                Image.asset(categoryImages[index], height: 120, width: 200, fit: BoxFit.fill),
                10.heightBox,
                "${categoriesLists[index]}".text.color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() { 
              Get.to(() => CategoryDetails(title: categoriesLists[index]));
            });
          })),
        ),
      )
    );
  }
}