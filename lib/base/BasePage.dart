import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BasePageController.dart';

abstract class BasePage<T> extends StatelessWidget {
  // Controller
  late BasePageController ctrl;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  BasePage({Key? key, BasePageController? controller}) : super(key: key) {
    if (controller != null) {
      ctrl = controller;
    }
  }

  // 화면에서 사용
  AppBar? setAppBar();

  // 화면에서 사용
  Widget setBuild();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar(),
      body: setBuild(),
      key: _scaffoldKey,
    );
  }
}