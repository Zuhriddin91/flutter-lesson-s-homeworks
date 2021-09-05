import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/coffee_data_list.dart';
import 'package:portfolio/models/coffee_model.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class CoffeeInfoPage extends StatefulWidget {
  Coffee coffee;

  CoffeeInfoPage(this.coffee);

  @override
  _CoffeeInfoPageState createState() => _CoffeeInfoPageState();
}

class _CoffeeInfoPageState extends State<CoffeeInfoPage> {
  Size _size;
  Coffee _coffee;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _coffee = widget.coffee; // asosiy widgetdan keladigan

    return Scaffold(
      backgroundColor: Color(0xFF151820),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---- first box ----

            Container(
              height: _size.height * 0.6,
              width: _size.width,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.brown.shade600,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_coffee.rasmUrl),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45.0,
                          width: 45.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFF202020)),

                          child: IconButton(
                            padding: EdgeInsets.only(bottom: 0),
                            color: Colors.red,
                            alignment: Alignment.topCenter,
                            icon: Icon(Icons.keyboard_arrow_left_sharp,
                              size: 40.0, color: Colors.grey.shade600),
                            onPressed: () => Navigator.pop(context),
                          )
                        ),
                        GestureDetector(
                          child: Container(
                            height: 45.0,
                            width: 45.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xFF202020)),
                            child:
                                Icon(Icons.favorite,
                                    color: faworiteColor ? Colors.pinkAccent : Colors.grey.shade600),
                          ),
                          onTap: () {
                            faworiteColor ? faworiteColor = false : faworiteColor = true;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),

                  // birinci box ichidagi matoviy box
                  GlassContainer(
                    opacity: 0.15,
                    blur: 10,
                    shadowStrength: 1,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      height: _size.height * 0.2,
                      width: _size.width,
                      decoration: BoxDecoration(
                        // color: Colors.brown.shade800,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _coffee.nomi,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 27),
                                ),
                                Text(
                                  _coffee.tarkib,
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "⭐  ${_coffee.rating.toString()} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "(6.986)",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 55.0,
                                      width: 55.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Color(0xFF202020)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            width: 18,
                                            image: NetworkImage(
                                                "https://www.gallson.sk/wp-content/uploads/2020/07/K%C3%A1va-O.png"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Coffee",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 55.0,
                                      width: 55.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Color(0xFF202020)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            width: 12,
                                            image: NetworkImage(
                                                "https://www.nicepng.com/png/full/436-4360558_orange-drop-png.png"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Milk",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 40.0,
                                  width: 120.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.0),
                                      color: Color(0xFF202020)),
                                  child: Text(
                                    "Medium Roasted",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 25, left: 20),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Description \n\n",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.white)),
                  TextSpan(
                      text: "A cappuchino is a coffee-based drink made",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  TextSpan(
                      text: "\n\nprimary from espresso and milk",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  TextSpan(
                      text: "... ",
                      style: TextStyle(fontSize: 16, color: Colors.white54)),
                  TextSpan(
                      text: "Read More",
                      style: TextStyle(fontSize: 16, color: Colors.orange)),
                  TextSpan(
                      text: "\n\n\nSize",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _buttonSideColor1 = Colors.orange;
                      _buttonSideColor2 = Colors.transparent;
                      _buttonSideColor3 = Colors.transparent;
                      cofeRazmer = 1.0;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(_size.width * 0.25, 40),
                      side: BorderSide(
                        color: _buttonSideColor1,
                      ),
                    ),
                    child: Text(
                      "S",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _buttonSideColor1 = Colors.transparent;
                      _buttonSideColor2 = Colors.orange;
                      _buttonSideColor3 = Colors.transparent;
                      cofeRazmer = 1.25;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(_size.width * 0.25, 40),
                      side: BorderSide(
                        color: _buttonSideColor2,
                      ),
                    ),
                    child: Text(
                      "M",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _buttonSideColor1 = Colors.transparent;
                      _buttonSideColor2 = Colors.transparent;
                      _buttonSideColor3 = Colors.orange;
                      cofeRazmer = 1.5;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(_size.width * 0.25, 40),
                      side: BorderSide(
                        color: _buttonSideColor3,
                      ),
                    ),
                    child: Text(
                      "L",
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Price", style: TextStyle(color: Colors.white54)),
                      SizedBox(height: 5.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "\$ ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.orange)),
                            TextSpan(
                                text: (_coffee.narx * cofeRazmer).toStringAsFixed(2),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(_size.width * 0.6, 50),
                    ),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _buttonSideColor1 = Colors.orange;
  Color _buttonSideColor2 = Colors.transparent;
  Color _buttonSideColor3 = Colors.transparent;
  double cofeRazmer = 1.0;
  bool faworiteColor = false;
}
