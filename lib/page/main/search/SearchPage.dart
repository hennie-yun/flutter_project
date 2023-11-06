import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../../../base/BasePage.dart';
import '../../../constants/SampleColor.dart';

class SearchPage extends BasePage<SearchPageController> {

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

  Future<List<dynamic>> fetchAlbums() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    List albumList = [];

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      albumList = json.decode(response.body);
      return albumList;
    } else {
      throw Exception('실패 ');
    }
  }

  @override
  Widget setBuild() {
    return FutureBuilder<List<dynamic>>(
      future: fetchAlbums(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //데이터를 아직 받아 오지 못해쓸 때 실행 되는 부분
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {         // 데이터 성공
          List? data = snapshot.data;
          if (data == null || data.isEmpty) {
            return const Text('데이터없음');
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container (
                    margin: const EdgeInsets.only(left: 24),
                    height: 26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Colors.yellow),

                    child : Text(data[index]['title'] ,
                        style: TextStyle(color : Colors.blueGrey, fontWeight: FontWeight.w500,fontSize: 20)));

              },
            );
          }
        }
      },
    );
  }


}

class SearchPageController {
}
