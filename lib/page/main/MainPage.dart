import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../manager/GlobalController.dart';
import 'MainPageController.dart';
import 'home/HomePage.dart';
import 'investment/InvestmentPage.dart';

class MainPage extends StatelessWidget {

  final MainPageController ctrl = Get.put(MainPageController());
  // final GlobalController _globalCtrl = Get.put(GlobalController());

  final GlobalController _globalCtrl = Get.find<GlobalController>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  MainPage({super.key});




Widget setBottom() {
  return Obx(() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: _globalCtrl.selectedIndex.value == 0 ?
            Icon(Icons.home_filled, color: Colors.black) :
            Icon(Icons.home_outlined, color: Colors.black),
            label: 'home'),
        BottomNavigationBarItem(
            icon: _globalCtrl.selectedIndex.value == 1 ? Icon(
              Icons.search, color: Colors.black,) : Icon(
              Icons.search_off, color: Colors.black,),
            label: 'search'
        ),
        BottomNavigationBarItem(
            icon: _globalCtrl.selectedIndex.value == 2 ? Icon(
              Icons.shopping_bag, color: Colors.black,) : Icon(
                Icons.shopping_bag_outlined, color: Colors.black),
            label: 'media'
        ),
        BottomNavigationBarItem(
            icon: _globalCtrl.selectedIndex.value == 3 ? Icon(
              Icons.movie, color: Colors.black,) : Icon(
              Icons.movie_outlined, color: Colors.black,),
            label: 'shop'
        ),
        BottomNavigationBarItem(
            icon: _globalCtrl.selectedIndex.value == 4 ? Icon(
                Icons.person, color: Colors.black) : Icon(
              Icons.person_outline, color: Colors.black,),
            label: 'profile'
        )
      ],

      currentIndex: _globalCtrl.selectedIndex.value,
      selectedItemColor: Colors.black,

      onTap: (value) {
        _globalCtrl.selectedIndex.value = value;
        switch (value) {
          case 0:
            _globalCtrl.setCurrWidget(HomePage());
            break;
          case 1:
            _globalCtrl.setCurrWidget(InvestmentPage());
            break;
          case 2:
            _globalCtrl.setCurrWidget(HomePage());
            break;
          case 3:
            _globalCtrl.setCurrWidget(HomePage());
            break;
          case 4:
            _globalCtrl.setCurrWidget(HomePage());
            break;
        }
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Obx(() {
          return _globalCtrl.currentWidget.value;
        }),
      ),
      bottomNavigationBar: setBottom(),
    );
  }
}

