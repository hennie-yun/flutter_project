import 'package:get/get.dart';

class HomePageController extends GetxController {


//JSON 형태로 만들어서 변수 미리 선언 하고 다 채워 놓고
// page 가서 그냥 불러와서 사용만 하는 거 연습

 List<Map<String, dynamic>> interestTabs = [
  {
   "jmimg": "assets/images/jm_1.png",
   "jmname": "네이버",
   "jmchart": "assets/images/bluechart.png",
   "jmprice": "204,500원",
   "jmyield": "500 (-0.24%)"
  },
  {
   "jmimg": "assets/images/jm_2.png",
   "jmname": "상상인증권",
   "jmchart": "assets/images/redchart.png",
   "jmprice": "812원",
   "jmyield": "3 (29.89%)"
  },
  {
   "jmimg": "assets/images/jm_3.png",
   "jmname": "SK이노베이션",
   "jmchart": "assets/images/bluechart.png",
   "jmprice": "206,500원",
   "jmyield": "6800 (-29.89%)"
  },
  {
   "jmimg": "assets/images/jm_4.png",
   "jmname": "애플",
   "jmchart": "assets/images/redchart.png",
   "jmprice": "\$179.21",
   "jmyield": "0.37 (0.21%)"
  },
  {

   "jmimg": "assets/images/jm_5.png",
   "jmname": "버크셔 해서웨이",
   "jmchart": "assets/images/redchart.png",
   "jmprice": "\$508,199.93",
   "jmyield": "50,819.93 (1.49%)"
  },
  {
   "jmimg": "assets/images/jm_1.png",
   "jmname": "네이버",
   "jmchart": "assets/images/bluechart.png",
   "jmprice": "204,500원",
   "jmyield": "500 (-0.24%)"
  },
  {
   "jmimg": "assets/images/jm_2.png",
   "jmname": "상상인증권",
   "jmchart": "assets/images/redchart.png",
   "jmprice": "812원",
   "jmyield": "3 (29.89%)"
  },
  {
   "jmimg": "assets/images/jm_3.png",
   "jmname": "SK이노베이션",
   "jmchart": "assets/images/bluechart.png",
   "jmprice": "206,500원",
   "jmyield": "6800 (-29.89%)"
  },
  {
   "jmimg": "assets/images/jm_4.png",
   "jmname": "애플",
   "jmchart": "assets/images/redchart.png",
   "jmprice": "\$179.21",
   "jmyield": "0.37 (0.21%)"
  },
  {
   "jmimg": "assets/images/jm_5.png",
   "jmname": "버크셔 해서웨이",
   "jmchart": "assets/images/redchart.png",
   "jmprice": "\$508,199.93",
   "jmyield": "50,819.93 (1.49%)"
  }
 ];

 List<Map<String, dynamic>> getInterestTabs() {
  return interestTabs;
 }
}