// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../permission/PermissionPage.dart';


class SplashPageController extends GetxController {
  //int count = 10 ->
  var count =
      0.obs; //obs를 붙여서 int count = 10 이 이렇게 변했음 -> 뒤에 변수 값으로 얘네가 알아서 타입 값을 정함,
  String type = ""; // null 값 허용 안함
  late Timer _timer; // late 는 변수의 초기화를 미룰 수 있게 해준다. _ 는 private
  var isStart = false.obs; // 타이머 시작 여부

  void startTimer() {
    if (!isStart.value) {
      isStart.value = true;
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
        if (count >= 100) {
          _timer.cancel();

          var result = await Get.bottomSheet(PermissionPage(),
              isScrollControlled:true,
              enableDrag: false,
              ignoreSafeArea: false)

        as Map<String, dynamic>?;
          print(result);
          if (result != null && result['yes'] as bool == true) {
            Get.offAllNamed('/mainPage');
          } else {
            SystemNavigator.pop();
            //시스템 종료
          }
        } else {
          // 상태 변경에 대해 알린다. 화면을 다시 그린다

          count.value++; // 카운트 1 차감
        }
      });
    }
  }

  /// 카운트 종료
  void _stopTimer() {
    isStart.value = false;
    _timer.cancel();
  }
}

//  () 안에 위젯 -> 밑에서 위로 올라오는 다이알로그

// Get.generalDialog(pageBuilder: pageBuilder) // 그냥 다이얼록 띄우는거

// 메인 페이지로 이동
// Get.to(() =>  MainPage());               // to : 기본적인 화면 이동
// Get.to(() => MainPage(), arguments: {}); // arguments를 통해 값을 넘길 수 있다.
// Get.toNamed('/mainPage');                // toNamed : Router에 지정한 이름 사용해 화면 이동
// Get.off(() => MainPage());               // off : 이전화면 하나만 지우고 이동.
// Get.offAllNamed('/mainPage');            // offAllNamed : 이전화면 모두 지우고 이동. PageRouter 에 명시된 이름 사용
// 참조 : https://velog.io/@chjo0330/Flutter-GetX%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-Navigation%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%9D%B4%EB%8F%99
