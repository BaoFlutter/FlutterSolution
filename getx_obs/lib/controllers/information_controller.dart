import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationController extends GetxController{

  var name = "".obs;
  var zalo = "".obs;
  var website = "".obs;
  var description = "".obs;


  updateInformation({@required name, @required zalo, @required website, @required description}){
    this.name = name;
    this.zalo = zalo ;
    this.website = website;
    this.description = description;
  }

}