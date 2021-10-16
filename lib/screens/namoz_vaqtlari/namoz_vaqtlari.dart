import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/models/namoz_json_model.dart';
import 'package:http/http.dart' as http;

class NamozVaqtlariUi extends StatefulWidget {

  @override
  _NamozVaqtlariUiState createState() => _NamozVaqtlariUiState();
}

class _NamozVaqtlariUiState extends State<NamozVaqtlariUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: _getNamozVaqti(),
              builder: (BuildContext context, AsyncSnapshot<List<NamozVaqtModel>> snap){
                return snap.hasData ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      var namozKuni = snap.data![index];
                  return Card(
                    color: Colors.cyanAccent,
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      title: Text("Peshin:"+namozKuni.timings!.dhuhr.toString()),
                      subtitle: Text(namozKuni.date!.readable.toString())),
                  );
                }): CircularProgressIndicator();
          }),
        ],
      ),),
    );
  }
  int month = 11;

  Future<List<NamozVaqtModel>> _getNamozVaqti() async {
    var url = Uri.parse("http://api.aladhan.com/v1/calendarByCity?city=Tashkent&country=Uzbekistan&method=2&month=${month}&year=2021");
    var response = await  http.get(url);

    if( response.statusCode == 200 ) {
      return (json.decode(response.body)['data'] as List).map((e) => NamozVaqtModel.fromJson(e)).toList();
    }else {
      throw Exception("Xato: ${response.statusCode}");
    }
  }
}
