import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:audioplayers/audioplayers.dart';


class AudioDictionary extends StatefulWidget {

  @override
  _AudioDictionaryState createState() => _AudioDictionaryState();
}

class _AudioDictionaryState extends State<AudioDictionary> {
  String nameOfWord = "", copyName = "";
  TextEditingController _controller = TextEditingController();
  //AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI with API and Audio",
        style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
