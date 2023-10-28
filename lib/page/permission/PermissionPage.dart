import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../../constants/SampleColor.dart';

import 'package:flutter/material.dart';

import '../../constants/SampleWidget.dart';

class PermissionPage extends StatelessWidget {
  Widget _addSubText(String imgUrl, String title, String contents) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Image.asset(imgUrl, height: 24, width: 24),
            const SizedBox(width: 12),
            Container(
              height: 24,
              alignment: Alignment.centerLeft,
              child: addTextWidget(title,
                  color: SampleColor.txtBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(height: 6),
        Container(
            margin: const EdgeInsets.only(left: 36),
            child: addTextWidget(
              contents,
              color: SampleColor.txtBlack,
              maxLines: 3,
            ))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 26),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '상상인증권의 서비스를 이용하려면 \n아래 기능의 접근 권한 동의가 필요해요.',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF424242),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFadb5bd),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        // margin: const EdgeInsets.only(left : 12 ),

                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text('필수 권한',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white))),
                            _addSubText(
                                "assets/images/icon_media.png",
                                "파일 및 미디어 (저장공간)",
                                "앱 실행에 필요한 파일 읽기 및 저장에 필요한 권한"),
                            _addSubText("assets/images/icon_call.png", "전화",
                                "단말정보확인, 고객지원센터 전화 연결 등의 업무에 필요 한 권한"),
                            _addSubText("assets/images/icon_sms.png", "SMS",
                                "휴대폰 본인인증이 요구 되는 업무에 필요 한 권한"),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Divider(
                                  thickness: 1, height: 1, color: Colors.white),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text('선택 권한',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white))),
                            _addSubText("assets/images/icon_camera.png", "카메라",
                                "신분증 촬영이 요구 되는 업무에 관한 권한"),
                          ],
                        ),
                      ),
                    ),

                    //하단 박스 영역
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                    '• 고객 편의를 우히나 서비스 제공을 위해 위 권한을 사용하고 있으며, '
                                    '서비스 이용에 필요한 항목만 필수 접근 하고 있습니다. ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF777777)))),
                            Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                    '• 선택 접근 권한에 동의하지 않아도 앱 이용이 가능하나 '
                                    '일부 서비스 이용에 제한이 있을 수 있습니다 ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF777777)))),
                            Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                    '• 접근 권한 설정은 상상인증권 > 설정에서 권한별 변경이 가능합니다.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF777777)))),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          )),

      //
      Expanded(
        flex: 1,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          addButtonWidget("취소",
              bgColor: SampleColor.bgSecond,
              txtColor: SampleColor.txtPrimary,
              callback: () => {
                    Get.back(result: {"result": false})
                  }),
          const SizedBox(width: 12),
          addButtonWidget("확인",
              callback: () => {
                    Get.back(result: {"yes": true})
                  })

          // ElevatedButton(
          //     onPressed: () {
          //       // Navigator.pop(context, true);
          //
          //       Get.back(result: {'yes': true});
          //     },
          //     style: ElevatedButton.styleFrom(
          //         minimumSize: const Size(150, 40),
          //         backgroundColor: SampleColor.primary),
          //     child: const Text("동의",
          //         style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.white,
          //         ))),
          // ElevatedButton(
          //     onPressed: () {
          //       Get.back(result: {'result': false});
          //
          //       // SystemChannels.platform
          //       //     .invokeMethod('SystemNavigator.pop');
          //     },
          //     style: ElevatedButton.styleFrom(
          //         minimumSize: const Size(150, 40),
          //         backgroundColor: SampleColor.primary),
          //     child: const Text("동의안함",
          //         style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.white,
          //         ))),
        ]),
      ),
    ])));
  }
}
