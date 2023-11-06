import 'package:get/get.dart';

enum StockType { kospi, kosdaq }

enum DaySelect { d3, d5, d7, d10 }

class InvestmentPageController extends GetxController {
  Rx<StockType> _stockType = StockType.kospi.obs;
  Rx<DaySelect> _selectedValue = DaySelect.d3.obs;

  StockType get stockType => _stockType.value;

  DaySelect get selectedValue => _selectedValue.value;

  // Update the values using methods
  void setStockType(StockType value) {
    _stockType.value = value;
  }

  void setSelectedValue(DaySelect value) {
    _selectedValue.value = value;
  }

  RxList<Map<String, dynamic>> stockList = <Map<String, dynamic>>[
    {
      "id": 1,
      "name": "삼성전자",
      "currentprice": 76636.56,
      "marketcapitalization": 343215862112.52,
      "Date": "2023-10-28"
    },
    {
      "id": 2,
      "name": "삼성전자",
      "currentprice": 75294.13,
      "marketcapitalization": 332862345463.78,
      "Date": "2023-10-29"
    },
    {
      "id": 3,
      "name": "삼성전자",
      "currentprice": 75791.48,
      "marketcapitalization": 310346586511.88,
      "Date": "2023-10-30"
    },
    {
      "id": 4,
      "name": "삼성전자",
      "currentprice": 76514.95,
      "marketcapitalization": 332455107387.93,
      "Date": "2023-10-31"
    },
    {
      "id": 5,
      "name": "삼성전자",
      "currentprice": 79040.32,
      "marketcapitalization": 317174956689.22,
      "Date": "2023-11-01"
    },
    {
      "id": 6,
      "name": "삼성전자",
      "currentprice": 76984.69,
      "marketcapitalization": 315693828149.92,
      "Date": "2023-11-02"
    },
    {
      "id": 7,
      "name": "삼성전자",
      "currentprice": 75438.86,
      "marketcapitalization": 347446330131.73,
      "Date": "2023-11-03"
    },
    {
      "id": 8,
      "name": "삼성전자",
      "currentprice": 79447.65,
      "marketcapitalization": 321542578810.53,
      "Date": "2023-11-04"
    },
    {
      "id": 9,
      "name": "삼성전자",
      "currentprice": 78340.87,
      "marketcapitalization": 324591503832.52,
      "Date": "2023-11-05"
    },
    {
      "id": 10,
      "name": "삼성전자",
      "currentprice": 78145.25,
      "marketcapitalization": 305511115090.23,
      "Date": "2023-11-06"
    }
  ].obs;

  RxList<Map<String, dynamic>> getStockListTabs() {
    return stockList;
  }

  List<Map<String, dynamic>> getPrice(int number) {

    print ("@@@@@@@@@@@@@@@@@@");
    print (number);


    if (number <= 0) {
      return <Map<String, dynamic>>[];
    }

    // List<Map<String, dynamic>> priceList = List.from(stockList);

    List<Map<String, dynamic>> priceList = [];

//오늘 날짜의 데이터를 구하기 위한 것

    Map<String, dynamic> todayData = {};
    DateTime today = DateTime.now(); //오늘 날짜가져오기
    String formattedDate =
        "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day
        .toString().padLeft(2, '0')}";

print (formattedDate);

    for (var item in stockList) {
      if (item["Date"] == formattedDate) {
        todayData = item;
        break;
      }
    }

    print (todayData);
    if (todayData.isEmpty) {
      return <Map<String, dynamic>>[];
    }

    // 현재 데이터에 필요한거 :  현재가, 시가총액
    // Number로 넘어온 데이터에서 필요한 것 :그 날의 현재가

    double PriceChange = calculatePriceChange(stockList, number);
    print (PriceChange);
    double currentPrice = todayData["currentprice"]; //오늘 날짜의 현재가
    double previousPrice = todayData["id"] - number;
    print (previousPrice);



    for (int i = 0; i < priceList.length; i++) {
      if (priceList[i]["Date"] == formattedDate) {
        if (i - number >= 0) {
          previousPrice = priceList[i - number]["currentprice"];
        }
        break;
      }
    }

    // 등락률 계산
    double change = ((currentPrice - previousPrice) / previousPrice) * 100;

    // 각 항목에 등락가 및 등락률을 추가합니다.
    todayData["change"] = change;
    todayData["previousPrice"] = previousPrice;

    // 다른 항목들을 리턴할 목록에 추가합니다.
    priceList.insert(0, todayData);
print (priceList);

    return priceList;


  }

  double calculatePriceChange(
      List<Map<String, dynamic>> stockList, int number) {
    if (number <= 0 || stockList.isEmpty) {
      return 0.0; // 기간이 0보다 작거나 주식 데이터가 없을 경우 0 반환
    }

    // 오늘의 날짜 가져오기
    DateTime today = DateTime.now();
    String formattedDate =
        "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    // 오늘의 currentPrice 찾기
    double currentPrice = 0.0;
    for (var item in stockList) {
      if (item["Date"] == formattedDate) {
        currentPrice = item["currentprice"];
        break;
      }
    }

    if (currentPrice == 0.0) {
      return 0.0; // 오늘의 currentPrice가 없을 경우 0 반환
    }

    // number일 전의 currentPrice 찾기
    double previousPrice = 0.0;
    for (var item in stockList) {
      // number일 전의 날짜 계산
      DateTime previousDate = today.subtract(Duration(days: number));
      String formattedPreviousDate =
          "${previousDate.year}-${previousDate.month.toString().padLeft(2, '0')}-${previousDate.day.toString().padLeft(2, '0')}";

      if (item["Date"] == formattedPreviousDate) {
        previousPrice = item["currentprice"];
        break;
      }
    }

    // 등락가 계산
    double priceChange = currentPrice - previousPrice;
    return priceChange;
  }

}
