import 'package:final_project2handecom/consts/consts.dart';
import 'package:final_project2handecom/controllers/home_controller.dart';
import 'package:final_project2handecom/views/cart_screen/cart_screen.dart';
import 'package:final_project2handecom/views/category_screen/category_screen.dart';
import 'package:final_project2handecom/views/home_screen/home_screen.dart';
import 'package:final_project2handecom/views/profile_screen/profile_screeen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    //init home controller
    var  controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26), label: account)
    ];


    var navBody = [ const HomeScreen(),const CategoriesScreen(), const CartScreen(), const ProfileScreen()];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(() => 
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: mainGreen,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
          ),
      ),
    );
  }
}