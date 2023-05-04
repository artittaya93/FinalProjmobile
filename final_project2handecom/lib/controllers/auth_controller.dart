//firebase part


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project2handecom/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  //text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //login method

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try{

      await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;

   }

    //signup method

   Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try{

      await auth.createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;

   }

   //storing data method
   storeUSerData({name, passwprd, email, required String password}) async {

    DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({'name': name, 'password': password, 'email': email, 'imageUrl': ''});
   }

   //signout method
   signoutMethod(context) async{
    try{
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
   }

}