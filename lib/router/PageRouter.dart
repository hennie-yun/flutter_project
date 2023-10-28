
import 'package:get/get.dart';

import '../constants/Constants.dart';
import '../page/main/MainPage.dart';
import '../page/splash/SplashPage.dart';

/// PageRouter
/// 화면 ( page ) 및 이름 ( ex. /splashPage ), 전환 효과 ( transition ) 등 정의
class PageRouter {
  static final route = [
    // 스플레쉬. 기동화면
    GetPage(
      name: '/splashPage',
      page: () => SplashPage(type : Constants.MTS_PRPJECT_TYPE),
        transition: Transition.leftToRight
    ),
    // 메인 화면
    GetPage(
      name: '/mainPage',
      page: () => MainPage(),
      transition: Transition.upToDown
    ),
  ];
}