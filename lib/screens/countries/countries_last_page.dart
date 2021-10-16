import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/models/countries_api_model.dart';

class CountriesLastPage extends StatefulWidget {
  String img;
  int index;

  CountriesLastPage(this.img, this.index);

  @override
  _CountriesLastPageState createState() => _CountriesLastPageState();
}

class _CountriesLastPageState extends State<CountriesLastPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool check = false, push = false;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTopScroll(),
          buildInfoField(widget.index),
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildTopScroll() {
    return Stack(
      children: [
        Container(
          height: 270,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            isScrollable: true,
            onTap: (v) => setState(() {
              _currentIndex = v;
            }),
            controller: _tabController,
            tabs: [
              tabMark(Colors.yellow),
              tabMark(Colors.cyanAccent),
              tabMark(Colors.yellow),
              tabMark(Colors.cyanAccent),
              tabMark(Colors.yellow),
            ],
          ),
        ),
        _showSmoothIndicator()
      ],
    );
  }

  Widget tabMark(Color color) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(widget.img))),
      margin: EdgeInsets.only(right: 5),
    );
  }

  Widget buildInfoField(int index) {
    return Expanded(
      child: SingleChildScrollView(
        child: FutureBuilder(
            future: _countriesMaker(),
            builder: (context, AsyncSnapshot<List<Countries>> snap) {
              if (snap.hasData) {
                var country = snap.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${country![index].region}, ${country[index].name!.official}, ${country[index].capital!.last}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "${country[index].region}, ${country[index].name!.official}, ${country[index].capital!.last}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonMark(Icons.call),
                              buttonMark(CupertinoIcons.location_north_fill, country: country[index].maps!.googleMaps.toString()),
                              buttonMark(Icons.share_outlined),
                              buttonMark(Icons.calendar_today),
                              SizedBox(width: 30),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.green),
                                    fixedSize: Size(80, 40),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(color: Colors.green),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              "Information",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                     Text(country[index].flag!.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(country[index].area!.toInt().toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Text("Area",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(country[index].population.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("population",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.golf_course,
                                    size: 20,
                                  ),
                                  Text("18 holes",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "${country[index].region}, ${country[index].name!.official}, ${country[index].capital!.last}" * 10,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,),
                            ),
                          ),
                          SizedBox(height: 5),
                          Card(
                            color: Colors.grey.shade200,
                            child:
                            ListTile(
                              leading: Text("Show scorecard", style: TextStyle(
                                color: Colors.grey, fontSize: 17
                              ),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                            ),),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Widget buttonMark(IconData icon, {String? country}) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.grey.shade600,
        ),
        onPressed: () {
          if(icon == CupertinoIcons.location_north_fill)
            launch(country!);
        },
      ),
    );
  }

  Widget buildButtons() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300))
      ),
      padding: const EdgeInsets.fromLTRB(20,24,20,16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          elevatedButtonMark(false, "Preview"),
          elevatedButtonMark(true, "Start Round"),
        ],
      ),
    );
  }

  Widget elevatedButtonMark(bool push, String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          check = push ? true : false;
        });
      },
      child: Text(
        text,
        style: TextStyle(
            color: check == push ? Colors.white : Colors.green, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        primary: check == push ? Colors.green : Colors.transparent,
        elevation: 0,
        fixedSize: Size(165, 50),
        side: BorderSide(
            color: check == push ? Colors.transparent : Colors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          //     side: BorderSide(
          //   color: check ? Colors.transparent : Colors.white,
          // ),
        ),
      ),
    );
  }

  Widget _showSmoothIndicator() => Positioned(
        left: 24.0,
        bottom: 16.0,
        child: Row(
          children: List.generate(
            5,
            (index) => Container(
              margin: const EdgeInsets.only(right: 6.0),
              width: _currentIndex == index ? 16.0 : 6.0,
              height: 6.0,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.white : Colors.white54,
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ),
      );

  Future<List<Countries>> _countriesMaker() async {
    var _respons =
        await http.get(Uri.parse("https://restcountries.com/v3.1/all#"));

    if (_respons.statusCode == 200) {
      return (json.decode(_respons.body) as List)
          .map((e) => Countries.fromJson(e))
          .toList();
    } else {
      throw Exception("Error ${_respons.statusCode}");
    }
  }
}
