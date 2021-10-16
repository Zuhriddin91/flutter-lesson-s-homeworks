import 'package:flutter/material.dart';

class ClickGame extends StatefulWidget {

  @override
  _ClickGameState createState() => _ClickGameState();
}

class _ClickGameState extends State<ClickGame> {
  late double width, height, h1, h2, step;
  bool setHight = true;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    if(setHight) {h1 = MediaQuery.of(context).size.height / 2;
    h2 = MediaQuery.of(context).size.height / 2;
    setHight = false;
    }
    step = MediaQuery.of(context).size.height / 20;

    return Scaffold(
      body: Column(children: [
        InkWell(
          child: Container(
            height: h1,
            color: Colors.pink,
          ),
           onTap: () {
            if(h1 < height-5) setState(() {
            h1 +=step;
            h2 -=step;
            });
          },
        ),
        InkWell(
          child: Container(
            height: h2,
            color: Colors.blueAccent,
          ),
          onTap: () {
            if(h2 < height -5) {
                setState(
                  () {
                    h1 -= step;
                    h2 += step;
                  },
                );
              }
            },
        ),
      ],),
    );
  }
}
