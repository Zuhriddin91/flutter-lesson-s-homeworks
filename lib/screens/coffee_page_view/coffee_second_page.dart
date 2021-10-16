import 'package:flutter/material.dart';

class CoffeeSecondPage extends StatefulWidget {
  @override
  _CoffeeSecondPageState createState() => _CoffeeSecondPageState();
}

class _CoffeeSecondPageState extends State<CoffeeSecondPage> {
  double? w, h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundColor(),
          buildBackgroundImage(),
          buildBottomInfo(),
          buildBackButton(),
          buildInfoCardOnCenter(),
          buildWhitePoints(),
          buildBlackPoints(),
        ],
      ),
    );
  }

  Widget buildWhitePoints() {
    return Stack(
          children: [
            buildPoint(288, 154, Colors.white, 4),
            buildPoint(280, 162, Colors.white, 4),
            buildPoint(272, 170, Colors.white, 4),
            buildPoint(264, 178, Colors.white, 4),
            buildPoint(256, 186, Colors.white, 4),
            buildPoint(248, 194, Colors.white, 4),
            buildPoint(240, 202, Colors.white, 4),
            buildPoint(228, 210, Colors.white, 8),
          ],
        );
  }

  Widget buildBlackPoints() {
    return Stack(
          children: [
            buildPoint(625, 129, Colors.black, 8),
            buildPoint(636, 140, Colors.black, 4),
            buildPoint(645, 148, Colors.black, 4),
            buildPoint(654, 156, Colors.black, 4),
            buildPoint(663, 164, Colors.black, 4),
            buildPoint(672, 172, Colors.black, 4),
            buildPoint(681, 180, Colors.black, 4),
            buildPoint(690, 188, Colors.black, 4),
          ],
        );
  }

  Widget buildPoint(double top, double left, Color color, double size ) {
    return Positioned(
          top: top,
          left: left,
          child: Icon(Icons.circle, color: color, size: size,)
        );
  }
  
  Widget buildInfoCardOnCenter() {
    return Positioned(
          left: 50,
          top: 290,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            width: 120,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Oakley",
                  style: TextStyle(color: Colors.grey, fontSize: 12,fontWeight: FontWeight.w600)),
              Text("Glasses",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
            ],
          ),
          ),
        );
  }

  Widget buildBackButton() {
    return Positioned(
      top: 30,
      left: 30,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.zero,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: IconButton(
              onPressed: () {Navigator.pop(context);},
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        ),
      ),
    );
  }

  Widget buildBackgroundColor() {
    return Container(
      color: Color(0xfff0f0f0),
      alignment: Alignment.topCenter,
      height: h,
      child: Container(
        color: Color(0xffe3dedb),
        height: 617,
      ),
    );
  }

  Widget buildBackgroundImage() {
    return Positioned(
      right: -110,
      top: 100,
      child: Image.asset(
        "assets/images/qiz.png",
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget buildBottomInfo() {
    return Positioned(
      bottom: 30,
      left: 25,
      right: 25,
      child: Container(
        height: 100,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 25, left: 40),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Cappuchino",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text("Coffee",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(width: 0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Price",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("\$ ",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text(
                      "25",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color(0xffd25334),
                  borderRadius: BorderRadius.circular(25)),
              child: Icon(Icons.add, color: Colors.white, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}
