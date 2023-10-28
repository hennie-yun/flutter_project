import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class BasePageController<T> extends GetxController {
  static const _TAG = 'BasePageController';
  var isForeground = false;

  late String className;

  // 앱 종료
  static const snackBarDuration = Duration(seconds: 2);
  DateTime? backButtonPressTime;

  @override
  void onInit() {
    super.onInit();
    className = T.toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onResume() {
    isForeground = true;
  }

  void onPause() {
  }

  void onForeground() {
    isForeground = true;
  }

  void onBackground() {
    isForeground = false;
  }

  Future<bool> onBackPressed() async {
    return true;
  }

  String getControllerTag();
}
