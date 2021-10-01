import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class SonTop extends StatefulWidget {
  @override
  _SonTopState createState() => _SonTopState();
}

class _SonTopState extends State<SonTop> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 550,
              padding: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              color: Colors.transparent,
              child: GridView(
                gridDelegate:
                    SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      maxCrossAxisExtent: 130,
                    ),
                padding: EdgeInsets.all(16),
                children: [
                  buttonmark(1),
                  buttonmark(2),
                  buttonmark(3),
                  buttonmark(4),
                  buttonmark(5),
                  buttonmark(6),
                  buttonmark(7),
                  buttonmark(8),
                  buttonmark(9),
                  buttonmark(10),
                  buttonmark(11),
                  buttonmark(12),
              ],
            ),
          ),
          Container(
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            color: color,
            ),
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Row(children:[Text("$text",style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),), ], mainAxisAlignment: MainAxisAlignment.center,),
          ),
          ElevatedButton(onPressed: (){setState(() {
            button1 = 0;
            button2 = 0;
            button3 = 0;
            color = Colors.amber;
            son = Random().nextInt(9) + 1;
            check = false;
            text = "Yuqoridan n sonini toping,\n3 ta imkoniyatingiz bor!";
          });}, child: Text("Start",style: TextStyle(fontSize: 26),))
        ],
      ),
    );
  }

  int  button1 = 0, button2 = 0, button3 = 0;
  int son =0;
  Color color = Colors.amber;
  String text = "Yuqoridan n sonini toping,\n3 ta imkoniyatingiz bor!";

  buttonmark(buttonSon) {
    if (son != 0 && ((button3 > son && buttonSon >= button3) || (button3 < son && buttonSon <= button3)))
      return fantom();
    else if (son != 0 && ((button2 > son && buttonSon >= button2) || (button2 < son && buttonSon <= button2)))
      return fantom();
    else if (son != 0 && ((button1 > son && buttonSon >= button1) || (button1 < son && buttonSon <= button1)))
      return fantom();
    else
      return button(buttonSon);
  }

  button(int buttonSon) => ElevatedButton(
      style: ElevatedButton.styleFrom(primary: check  && buttonSon == son ? Colors.pink :Colors.blue),
      child: Text(
        buttonSon.toString(),
        style: TextStyle(fontSize: 40),
      ),
      onPressed: button3 == 0
          ? () {
              if (buttonSon == son) {
                text = "Siz g'olib bo'ldingiz,\nto'g'ri javob $son";
                color = Colors.lightGreen;
                setState(() {   });
              }
              else
                setState(
                () {
                  if (button1 == 0) {
                    text = "2 ta imkon qoldi";
                    button1 = buttonSon;
                  } else if (button1 != 0 &&
                      button1 != buttonSon &&
                      button2 == 0) {
                    text = "1 ta imkon qoldi";
                    button2 = buttonSon;
                  } else if (button1 != 0 &&
                      button2 != 0 &&
                      button1 != buttonSon &&
                      button2 != buttonSon &&
                      button3 == 0) {
                    color = Colors.red;
                    text = "Yutkazdingiz!\nTo'g'ri javob $son";
                    button3 = buttonSon;
                    check = true;
                  }
                },
              );
            }
          : () {});

  bool check = false;

  // o'yindan chiqib ketgan sonlar uchun konteyner
  Widget fantom() => Container(
      color: Colors.grey.shade400,

      );
}
