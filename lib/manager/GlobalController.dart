
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../base/BasePage.dart';
import '../base/BasePageController.dart';
import '../page/main/home/HomePage.dart';

class GlobalController extends BasePageController<GlobalController> {
  static const TAG = 'GlobalController';

  var selectedIndex = 0.obs;
  var currentAppbar = Rx<AppBar?>(null);
  var currentWidget = Rx<BasePage>(HomePage());

  setAppBar(AppBar? appBar){
    currentAppbar.value = appBar;
  }

  setCurrWidget(BasePage widget){
    currentWidget.value = widget;
  }

  @override
  String getControllerTag(){
    return TAG;
  }
}