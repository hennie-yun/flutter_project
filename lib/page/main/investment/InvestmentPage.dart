import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../base/BasePage.dart';
import 'InvestmentPageController.dart';

class InvestmentPage extends BasePage<InvestmentPageController> {
  InvestmentPageController controller = InvestmentPageController();

  TextEditingController textController = TextEditingController();

  @override
  AppBar? setAppBar() {
    return AppBar();
  }

  @override
  Widget setBuild() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const Text(
        '종목검색',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      Container(
        height: 100,
        width: 700,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
        ),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: StockType.kospi,
                  groupValue: controller.stockType,
                  // Use the GetX controller's stockType
                  onChanged: (StockType? value) {
                    if (value != null) {
                      controller.setStockType(
                          value); // Set the stockType using the GetX controller method
                    }
                  },
                ),
                Text('코스피'),
                Radio(
                  value: StockType.kosdaq,
                  groupValue: controller.stockType,
                  // Use the GetX controller's stockType
                  onChanged: (StockType? value) {
                    if (value != null) {
                      controller.setStockType(
                          value); // Set the stockType using the GetX controller method
                    }
                  },
                ),
                Text('코스닥'),
                Text('종목명'),
                Container(
                  width: 150,
                  height: 50,
                  child: TextField(
                    controller: textController,
                    // You should have a TextEditingController defined
                    decoration: const InputDecoration(
                      labelText: 'Enter text',
                    ),
                  ),
                ),
              ],
            )),
      ),
      Obx(() => Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.orange, width: 1),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text('기간설정'),
                ElevatedButton(
                  onPressed: () {
                    controller.setSelectedValue(DaySelect.d3);
                    controller.getPrice(3);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: controller.selectedValue == DaySelect.d3
                        ? Colors.blue // 선택된 경우의 배경색
                        : Colors.grey, // 선택되지 않은 경우의 배경색
                  ),
                  child: const Text('3일'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.setSelectedValue(DaySelect.d5);
                    controller.getPrice(5);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: controller.selectedValue == DaySelect.d5
                        ? Colors.blue // 선택된 경우의 배경색
                        : Colors.grey, // 선택되지 않은 경우의 배경색
                  ),
                  child: const Text('5일'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.setSelectedValue(DaySelect.d7);
                    controller.getPrice(7);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: controller.selectedValue == DaySelect.d7
                        ? Colors.blue // 선택된 경우의 배경색
                        : Colors.grey, // 선택되지 않은 경우의 배경색
                  ),
                  child: const Text('7일'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.setSelectedValue(DaySelect.d10);
                    controller.getPrice(10);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: controller.selectedValue == DaySelect.d10
                        ? Colors.blue // 선택된 경우의 배경색
                        : Colors.grey, // 선택되지 않은 경우의 배경색
                  ),
                  child: const Text('10일'),
                ),
              ],
            ),
          ))
    ]);
  }
}
