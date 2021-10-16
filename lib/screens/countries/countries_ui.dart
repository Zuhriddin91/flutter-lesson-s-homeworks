import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:portfolio/models/countries_api_model.dart';
import 'package:portfolio/models/unsplash_api_model.dart';
import 'package:portfolio/models/weather_api_model.dart';
import 'countries_2nd_page.dart';

class CountriesHomePage extends StatefulWidget {
  @override
  State<CountriesHomePage> createState() => _CountriesHomePageState();
}

class _CountriesHomePageState extends State<CountriesHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  var textKey = GlobalKey<FormFieldState>();

  String country = "bukhara";
  String location = "Meadow Springs Golf And Country Club";
  String city = "San Fransisco, United States";
  String countryImg = "https://source.unsplash.com/random/1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopSection(),
            buildScrollView(),
            buildTextForScrollTitle(),
            buildBottomCard(context),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24),
            child: Text(
              "Countries",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: Text(
            "Finda place to play golf",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 8),
          child: TextField(
            key: textKey,
            controller: _textEditingController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.black),
              hintText: "Type to search",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.only(top: 12),
            ),
            style: TextStyle(fontSize: 20),
            onSubmitted: (v) => setState(() {
              if (_textEditingController.text.length >= 1) {
                country = v.toString();
                debugPrint(country);
              }
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby Countries",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xff6fc0a8)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 4),
          child: Text(
            "Near from Alliston Park, PA 15101",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget buildScrollView() {
    return Container(
      alignment: Alignment.center,
      height: 250,
      child: FutureBuilder(
          future: _countriesMaker(),
          builder: (context, AsyncSnapshot<List<Countries>> countrySnap) {
            if (countrySnap.hasData) {
              var country = countrySnap.data;
              debugPrint(country![0].name!.common.toString());
              return ListView.builder(
                padding: EdgeInsets.all(8),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 16,
                itemExtent: 180,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: getUnsplashData("${country[index].name!.common}"),
                    builder: (context, AsyncSnapshot unsplashSnap) {
                      return InkWell(
                        child: Hero(
                          tag: index,
                          child: Container(
                            padding: EdgeInsets.all(14),
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        unsplashSnap.data.toString()))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${country[index].region}, ${country[index].name!.common}, ${country[index].capital!.last}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "⭐ 4.2 - 0.3 mil",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Countries2Page(
                                  img: unsplashSnap.data.toString(),
                                  city: city,
                                  location: location,
                                  index: index),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget buildTextForScrollTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top Rated",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Text(
            "View All",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Color(0xff6fc0a8)),
          ),
        ],
      ),
    );
  }

  Widget buildBottomCard(context) {
    return InkWell(
      child: Hero(
        tag: "1",
        child: FutureBuilder(
          future: getUnsplashData(country),
          builder: (context, AsyncSnapshot<String> snap) {
            if (snap.hasData) {
              //debugPrint("unsplash data:" + snap.data!);
              countryImg = snap.data.toString();
              return Container(
                height: 220,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(snap.data.toString()),
                  ),
                ),
              );
            } else {
              return Container(
                height: 220,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.televes.com/media/wysiwyg/televes/error-televes.jpg"),
                  ),
                ),
              );
            }
          },
        ),
      ),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CountriesSecondPage(
        //       img: countryImg,
        //       city: country,
        //       location: location,
        //     ),
        //   ),
        // );
      },
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.golf_course), label: ""),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xff6fc0a8),
      currentIndex: 3,
    );
  }

  Future<String> getUnsplashData(city) async {
    //7N8ZN6u_0HEvxtBD7P9otYZsiELHHzLWnh_2Qfkz5xc //unsplash key
    var res = await http.get(Uri.parse(
        'https://api.unsplash.com/search/photos?per_page=1&query=$city&client_id=7N8ZN6u_0HEvxtBD7P9otYZsiELHHzLWnh_2Qfkz5xc'));
    if (res.statusCode == 200) {
      var rasm = json.decode(res.body);
      return rasm["results"][0]["urls"]["regular"].toString();
    } else {
      throw Exception("Xato kodi: ${res.statusCode}");
    }
  }

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
