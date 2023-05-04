import 'package:final_project2handecom/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget applogoWidget(){
  //using velocity_x here

  return Image.asset(icApplogo2).box.white.size(77, 77).padding(const EdgeInsets.all(8)).rounded.make();
}