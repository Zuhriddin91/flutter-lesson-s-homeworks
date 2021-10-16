import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/models/volkswagen_api_model.dart';
import 'package:http/http.dart' as http;

class CarShop extends StatelessWidget {
  double? height;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height - 60;
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
          child: FutureBuilder(
            future: _carApiMark(),
            builder: (context, AsyncSnapshot<List<VolksWagenModel>> snap) {
            var data = snap.data;
            return snap.hasData
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data!.length,
                   itemBuilder: (context, index) {
                    return Container(
                      height: height! / 4,
                      color: index % 2 == 0 ? Color(0xffe3edf0) : Colors.white,
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      )),
    );
  }

  Future<List<VolksWagenModel>> _carApiMark() async {
    var _responsive = await http.get(Uri.parse(
        "https://private-anon-4ef747164d-carsapi1.apiary-mock.com/cars"));
    if (_responsive.statusCode == 200) {
      return (json.decode(_responsive.body) as List)
          .map((e) => VolksWagenModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Error ${_responsive.statusCode}");
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      centerTitle: true,
      title: Text(
        "VOLKSWAGEN",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ))
      ],
    );
  }
}
