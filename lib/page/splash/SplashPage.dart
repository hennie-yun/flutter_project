

import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SplashPageController.dart';


class SplashPage extends StatelessWidget {
  SplashPageController controller = SplashPageController();

  SplashPage({type = ""}) {
    controller.type = type;
    controller.startTimer();
  }

  // 5초 카운트 후 화면 이동 ( -> MainPage )

  // @override
  // void setState(VoidCallback fn) {
  //   super.setState(fn);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img_splash.jpg'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text('고객님의 안전한 금융거래를 위해 \n 프로그램 실행을 준비중입니다',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        child: Obx(() {
                          double percent =
                              controller.count.value.toDouble() / 100;

                          return LinearPercentIndicator(
                            padding: EdgeInsets.only(left: 40),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 60,
                            backgroundColor: Colors.white,
                            percent: percent,
                            progressColor: Color(0xFFFEE500),
                            barRadius: Radius.circular(10),
                          );
                        })

                      // child : SizedBox(
                      //   child: Center(
                      //       child: CircularProgressIndicator()
                      //   ),
                      //   height: 100.0,
                      //   width: 200.0,
                      // ),

                        ),
                    Obx(() => Text('${controller.count.value}%',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)))
                  ],
                ),
              ),
            ],
          ),
        ));

    /// ⦿ Row
    /// 자식 위젯들을 가로로 정렬합니다.
    /// 메인 정렬 기준 ( mainAxisAlignment ) 는 가로입니다.
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center, // Row의 Main 정렬은 가로 기준
    //   children: [
    //     Obx(() => Visibility(
    //       visible: controller.isStart.value,
    //       /// ⦿ Container
    //       /// 박스형 위젯입니다. 너비 높이 지정하지 않을 시 부모 위젯에 맞게 바깥으로 확장됩니다.
    //       /// 추가로 안-밖 여백, 색상, 테두리 등 다양한 속성을 지정할 수 있습니다. div 느낌쓰
    //       child: Container(
    //         margin: const EdgeInsets.all(20),
    //         // color: SampleColor.blue,   // Container 배경 색 지정. border 등과 같이 적용하려면 boxDecoration 사용.
    //         // decoration 사용 시 color 속성은 사용할 수 없습니다. ( 중복 사용 시 에러남 )
    //         decoration: BoxDecoration(
    //             color: SampleColor.blue,
    //             borderRadius: const BorderRadius.all(Radius.circular(1))
    //         ),
    //         alignment: Alignment.center,                   // 자식 위젯 정렬
    //         height: 40,                                    // 높이 지정
    //         width: MediaQuery.of(context).size.width - 60, // MediaQuery를 통해 화면의 높이, 너비를 가져올 수 있다.
    //         // width: double.infinity,                //  => 이렇게 해도 된다.
    //           //Obx 로 아래 얘만 계속 돌려줌
    //         child: Text('${controller.count.value}초 뒤 메인 실행', style: const TextStyle(fontSize: 20))
    //       ),
    //     )),
    //     /// ⦿ Padding
    //     /// 안쪽 여백 ( Padding ) 지정 가능한 위젯입니다.
    //     /// 여백은 EdgeInsets 로 지정합니다
    //     Obx(() => Padding(
    //       padding: const EdgeInsets.only(left:4,right:4),
    //       child: Visibility(
    //         visible: !controller.isStart.value,
    //         /// 버튼 종류 중 하나 이것의 이벤트 핸들러는 온프레스
    //         child: ElevatedButton(
    //           onPressed: controller.startTimer,
    //           /// ⦿ SizedBox
    //           /// 박스형 위젯입니다. 너비 높이 지정하지 않을 시 자식 크기에 맞게 안쪽으로 축소됩니다.
    //           /// 기타 속성을 지정할 수 없습니다. 색상 마진 같은거 설정 못함 간단한건 이걸로해줌 속성 많으면 container 사용
    //           child: SizedBox(
    //             height: 24,
    //             width: 120,
    //             child: Text('클릭해봐 홈으로 감 ', textAlign: TextAlign.center, style: TextStyle(fontSize: 20) ),
    //           ),
    //         ),
    //       ),
    //     )
    //
    //     )],
    // )
  }
}
