import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/music_api_data.dart';
import 'package:http/http.dart' as http;

class MusicApp extends StatefulWidget {

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: buildAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xfffddf01),
        child: FutureBuilder(
            future: _getMusic(),
            builder: (context, AsyncSnapshot<List<Music>> snap) {
              var dataList = snap.data;
              return snap.hasData
                  ? ListView.builder(
                  itemCount: dataList!.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                    Music music = dataList[index];
                    return Stack(
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(bottom: 50, left: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.brown.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 0.5,
                                    offset: Offset(-10, 10))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox( width: 180,
                                      child: Text(
                                        music.author.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    SizedBox(width: 180 ,
                                      child: Text(
                                        music.downloadUrl.toString(),
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: RotatedBox(
                                  child: Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.grey,
                                  ),
                                  quarterTurns: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 15,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 45,
                              backgroundImage: NetworkImage(music.downloadUrl.toString()),
                            ),
                          ),
                        ),
                      ],
                    );
                  })
                  : CircularProgressIndicator();
            }
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xfffddf01),
      elevation: 0,
      centerTitle: true,
      title: Text("MUSICLIST"),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
      ],
    );
  }

  Future<List<Music>> _getMusic() async {
    var url = Uri.parse("https://picsum.photos/v2/list?page=2&limit=100");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Music.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato: ${response.statusCode}");
    }
  }
}
