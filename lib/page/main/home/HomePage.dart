import 'dart:convert';

import 'package:flutter/material.dart';


import '../../../base/BasePage.dart';
import '../../../constants/SampleColor.dart';
import 'HomePageController.dart';

class HomePage extends BasePage<HomePageController> {
  @override
  AppBar? setAppBar() {
    return AppBar(
      toolbarHeight: 64,
      backgroundColor: SampleColor.bgUiCard,
      elevation: 0,
      title: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 24,
                child: Image.asset("assets/images/icon_logo.png"),
              ),
            ],
          )),
    );
  }

  @override
  Widget setBuild() {
    return Column(children: [
      Container(
        color: SampleColor.bgUiCard,
        height: 100,
        child: Image.asset("assets/images/icon_banner.png"),
      ),
      Container(
          width: double.infinity,
          color: SampleColor.bgUiCard,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                _addContainerWidget("코스피", "2,225.67", "+ 0.2%"),
                _addContainerWidget("코스닥", "2767.95", "- 4.2%"),
                _addContainerWidget("다우니", "1,113.58", "- 12.2%"),
                _addContainerWidget("코스피", "2,225.67", "+ 1.2%")
              ]))),
      Container(
        margin: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 24),
                height: 26,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          child: Row(children: [
                            RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'MY',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF00B0AD))),
                                    TextSpan(
                                      text: '관심',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )),
                            Image.asset('assets/images/icon_arrow_R.png',
                                width: 24, height: 24),
                          ])),
                      Container(
                          margin: EdgeInsets.only(right: 24),
                          child: Row(children: [
                            Image.asset('assets/images/icon_pencil.png',
                                width: 18, height: 18),
                            const Text('편집',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF9E9E9E))),
                          ]))
                    ]) //Row 두개를 다시 Row 로 정렬해 줄 큰 Row 와 children
            ),
            // SizedBox(
            //     height: 400,
            //     child: Column(
            //       children: [
            //         _tabBar(),
            //         Expanded(
            //           child: _tabBarView(),
            //         ),
            //       ],
            //     )),
          ],
        ),
      ),
    ]);
  }





//배너 바로 아래 주가 지수 나온 부분 -> 나중에 API 긁어오면 될듯...?
  Widget _addContainerWidget(String jm, String price, String increase) {
    return Container(
        margin: EdgeInsets.only(left: 10),
        width: 150,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(jm,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                  ),
                  SizedBox(
                      width: 124,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(price,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15)),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Container(
                              width: 50,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: increase.contains("+")
                                    ? Color(0xFFFAECEB)
                                    : Color(0xFFE0EEFE),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(3, 6, 3, 6),
                                child: Text(increase,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: increase.contains("+")
                                            ? Colors.red
                                            : Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                        ],
                      ))
                ])));
  }

// Widget _addFirstTabBar(String jmimg, String jmname, String jmchart,
//     String jmprice, String jmyield) {
//   return Padding(
//     padding: EdgeInsets.only(bottom: 10),
//     child: Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로 방향으로 공간을 균등하게 분배
//       // crossAxisAlignment: CrossAxisAlignment.center, // 세로 방향에서 중앙 정렬
//
//       children: [
//         Image.asset(jmimg, width: 36, height: 36),
//         Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Text(
//                 jmname,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF222222),
//                 ),
//               ),
//             )),
//         Image.asset(
//           jmchart,
//           width: 56,
//           height: 36,
//         ),
//         Container(
//             width: 100,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   jmprice,
//                   style: TextStyle(
//                     color: jmchart.contains("bluechart")
//                         ? Color(0xFF2F68DD)
//                         : Color(0xFFDE3226),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(
//                         jmyield.contains("-")
//                             ? Icons.arrow_drop_down
//                             : Icons.arrow_drop_up,
//                         size: 12.0,
//                         color: jmyield.contains("-")
//                             ? Color(0xFF2F68DD)
//                             : Color(0xFFDE3226),
//                       ),
//                       Text(
//                         jmyield,
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           color: jmyield.contains("-")
//                               ? Color(0xFF2F68DD)
//                               : Color(0xFFDE3226),
//                         ),
//                       )
//                     ]),
//               ],
//             ))
//       ],
//     ),
//   );
// }


}
