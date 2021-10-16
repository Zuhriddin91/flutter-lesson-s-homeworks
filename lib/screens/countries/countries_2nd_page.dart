import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/countries_api_model.dart';
import 'package:portfolio/models/weather_api_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/screens/countries/countries_last_page.dart';

class Countries2Page extends StatefulWidget {
  String img, location, city;
  int index;
  Countries2Page({required this.img,required this.city, required this.location, required this.index});

  @override
  _CountriesSecondPageState createState() => _CountriesSecondPageState();
}

class _CountriesSecondPageState extends State<Countries2Page> {
  bool check = true;
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        buildBackgroundImage(widget.index),
        buildLeadingButton(),
      ]),
    );
  }

  Widget buildLeadingButton() {

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SafeArea(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  radius: 16,
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
            Spacer(),
            buildWeatherText(),
            buildLocationText(widget.index),
            buildButtons(),
            buildBottomSwipe(),

          ],
        ),
      );
  }

  Widget buildWeatherText() {
    return FutureBuilder(
        future: _weatherMake(),
        builder: (context, AsyncSnapshot<Weather> snap) {
          if( snap.hasData ) {
            Weather data = snap.data as Weather;
            debugPrint("Futuredagi data:"+snap.data.toString());
            return Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    //color: Colors.cyanAccent,
                      image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: NetworkImage(_weatherImageMark(
                              data.weather!.first.main.toString()))
                      )
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.main!.humidity.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Wind: ${data.wind!.speed.toString()} km/h NNE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }else {
            return Container(child: CircularProgressIndicator(),);
          }
        });
  }

  Widget buildLocationText(index) {
    return FutureBuilder(
      future: _countriesMaker(),
      builder: (context, AsyncSnapshot<List<Countries>> snap) {
        if(snap.hasData){
          var country = snap.data;
          cityName = country![index].capital!.first.toString();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                  child: Text(
                    "${country[index].region}, ${country[index].name!.official}, ${country[index].capital!.last}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                 "${country[index].region}, ${country[index].name!.common}, ${country[index].capital!.last}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            );
          }else{
          return Container();
        }
        });
  }

  Widget buildButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16.0),
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
        if(!push) Navigator.push(context,
        MaterialPageRoute(builder: (context) => CountriesLastPage(widget.img, widget.index,),),);
        setState(() {
          check = push ? true : false;
        });
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        primary: check == push ? Colors.green : Colors.transparent,
        elevation: 0,
        fixedSize: Size(173, 50),
        side: BorderSide(
            color: check == push ? Colors.transparent : Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          //     side: BorderSide(
          //   color: check ? Colors.transparent : Colors.white,
          // ),
        ),
      ),
    );
  }

  Widget buildBottomSwipe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.arrow_up_circle_fill,
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          "Swipe for detail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildBackgroundImage(index) {
    return Hero(
      tag: index,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: NetworkImage(widget.img))),
      ),
    );
  }
  
  Future<Map> _weatherMaker() async {
    var res = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=tashkent&appid=32f9809b858541f09356b674b71cd912"));
    if(res.statusCode == 200){
      var json = jsonDecode(res.body);
      debugPrint(json);
      return json;
    }else{
      throw Exception("Error ${res.statusCode}");
    }
  }

  Future<Weather> _weatherMake() async {
    print("poytaxt: " +cityName);
    var res = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=32f9809b858541f09356b674b71cd912"));
    if(res.statusCode == 200){
      var json = jsonDecode(res.body);
      return Weather.fromJson(json);
    }else{
      throw Exception("Error ${res.statusCode}");
    }
  }  

  _weatherImageMark(deskription){
    switch(deskription){
      case "Smoke":
        return "https://apksshare.com/wp-content/uploads/2021/06/Simple-weather-clock-widget-no-ads-APK-MOD-Download-0.9.70.png";
      default:
        return "https://cdn2.iconfinder.com/data/icons/weather-blue-filled-line/32/weather_cloud_rain_rainy_forecast_water_drop-1024.png";
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
