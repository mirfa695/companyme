import 'package:companyme/model_class/class%20Files.dart';
import 'package:companyme/model_class/class_login.dart';
import 'package:companyme/route/route_name.dart';
import 'package:companyme/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiController extends GetxController{
 LoginData? data;
 List<Files>? datas;
  Future loginUser(String name,String password)async{
    try{
     data=await ApiServices().loginApi(name, password);
     if(data!.message=='SUCCESS'){
       Get.toNamed(RouteName.homeRoute);
     }
     else{
       Get.snackbar('Error', data!.message!,
           backgroundColor: Colors.black.withOpacity(.4),
           colorText: Colors.white
       );
     }
    }
    catch(e){
      print(e);
      Get.snackbar('Error', e.toString(),
      backgroundColor: Colors.black.withOpacity(.4),
        colorText: Colors.white
      );
    }
  }
  Future getData()async{
    try{
      datas=await ApiServices().getData(data!.id!.toString());
    }
    catch(e){
      print(e);
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.black.withOpacity(.4),
          colorText: Colors.white
      );
    }
  }
}