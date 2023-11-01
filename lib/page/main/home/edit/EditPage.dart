import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:get/get.dart';

import '../../../../base/BasePage.dart';
import '../../../../constants/SampleColor.dart';

import '../HomePageController.dart';
import 'EditPageController.dart';

class EditPage extends BasePage<EditPageController> {
  HomePageController HPController = HomePageController();
  List<Map<String, dynamic>> interestTabs = [];

  @override
  AppBar? setAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: SampleColor.txtGrey, //색변경
      ),
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

  List<Widget> tabContents(List<Map<String, dynamic>> tabDataList) {
    var result = <Widget>[];
    for (var tabData in tabDataList) {
      result.add(
        _addFirstTabBar(
          tabData['jmimg'],
          tabData['jmname'],
          tabData['jmchart'],
          tabData['jmprice'],
          tabData['jmyield'],
        ),
      );
    }
    return result;
  }

  Widget _addFirstTabBar(String jmimg, String jmname, String jmchart,
      String jmprice, String jmyield) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 12, 24, 12),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로 방향으로 공간을 균등하게 분배
        // crossAxisAlignment: CrossAxisAlignment.center, // 세로 방향에서 중앙 정렬

        children: [
          Image.asset(jmimg, width: 36, height: 36),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              jmname,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),
          )),
          Image.asset(
            jmchart,
            width: 56,
            height: 36,
          ),
          Container(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    jmprice,
                    style: TextStyle(
                      color: jmchart.contains("bluechart")
                          ? Color(0xFF2F68DD)
                          : Color(0xFFDE3226),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          jmyield.contains("-")
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          size: 12.0,
                          color: jmyield.contains("-")
                              ? Color(0xFF2F68DD)
                              : Color(0xFFDE3226),
                        ),
                        Text(
                          jmyield,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: jmyield.contains("-")
                                ? Color(0xFF2F68DD)
                                : Color(0xFFDE3226),
                          ),
                        )
                      ]),
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget setBuild() {
    var interestTabs = HPController.getInterestTabs().obs;

    return Column(children: [
      Expanded(
        flex: 12,
        child: Obx(() => ReorderableListView(
              children: <Widget>[
                for (int index = 0;
                    index <
                        interestTabs.value.length;
                    index++)
                  ListTile(
                    key: Key('$index'),
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          tabContents(interestTabs.value
                             )[index],]),
                    trailing: Icon(Icons.drag_handle),
                  ),
              ],
              onReorder: (int oldIndex, int newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item =
                    interestTabs.value.removeAt(oldIndex);
                interestTabs.value
                    .insert(newIndex, item);
                interestTabs.refresh();

                HPController.updateUI();
              },
            )),
      ),
      Expanded(
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: SizedBox(
                // SizedBox 대신 Container를 사용 가능
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    print ('###########');
                    print (interestTabs.value.toList());
                    Get.back(result: {"yes": interestTabs.value.toList()});
                  },
                  child: Text('저장'),
                ),
              )))
    ]);
  }
}
