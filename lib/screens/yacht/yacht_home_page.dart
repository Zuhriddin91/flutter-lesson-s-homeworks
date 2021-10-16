import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/screens/yacht/yacht_info_page.dart';

class YachtHomePage extends StatefulWidget {
  @override
  _YachtHomePageState createState() => _YachtHomePageState();
}

class _YachtHomePageState extends State<YachtHomePage> with TickerProviderStateMixin{
  double? w, h;
  TabController? _tabController;
  int tabIndex =2;
  ScrollController? _scrollController;
  bool liked = false;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
    _scrollController = ScrollController(initialScrollOffset: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildBackgroundColor(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(),
                buildYachtText(),
                buildScrollCard(),
                buildBottomScroll(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined,
                            color: Colors.black),
                        onPressed: () {}),
                  ),
                  IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
                ],
              );
  }

  Widget buildYachtText() {
    return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 50),
                    child: Text(
                      "Yacht",
                      style: TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, bottom: 40),
                    child: Text(
                      "Charters",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ],
              );
  }

  Widget buildScrollCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildVerticalTabBar(),
        Container(
          width: w! * 0.75,
          height: 350,
          //color: Colors.grey,
          alignment: Alignment.center,
          child: ListView.builder(
            controller: _scrollController,
            itemExtent: 240,
            itemCount: 3,
            padding: EdgeInsets.only(right: 55, left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () { Navigator.push(context,
              MaterialPageRoute(builder: (context) { return YachtInfoPage();}));},
              child: Card(
                margin: EdgeInsets.only(bottom: 20, right: 10, left: 10, top: 20),
                color: Theme.of(context).primaryColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0, top: 65, right: 10),
                    child: Image.asset(
                      "assets/images/yacht/yacht_1.png",
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  cardInfo(),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBottomScroll() {
    return Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Popular",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(

                      width: w,
                      height: 169,
                      child: ListView(
                        padding: EdgeInsets.only(top: 25),
                        children: [
                          listTileMark(0, "Ocean Yacht", " 4.6"),
                          listTileMark(1, "Areadna Yacht", " 4.8"),

                        ],
                          ),
                    ),
                  ],
                ),
              );
  }

  Widget listTileMark( int  index, title, subtitle) {
    return Container(
      margin:  EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: index == 0 ? Colors.orange : Colors.grey.shade800,
            ),
            child: Image.asset("assets/images/yacht/yacht_1.png", fit: BoxFit.scaleDown),
            width: 70,
            height: 70,
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.grey, size: 14),
                  Text(subtitle,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget cardInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 20, 0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/yacht/insta.png",
                width: 26,
              ),
              SizedBox(width: 8),
              Text(
                "#yaching",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    liked = !liked;
                  });
                },
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Atlantida",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Yacht",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Text(
                    "\$",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "1000",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " / day",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildVerticalTabBar() {
    return Container(width: w! * 0.25,
                  height: 340,
                  //color: Colors.cyanAccent,
                  alignment: Alignment.topRight,
                    child: RotatedBox(
                        child: TabBar(
                          labelColor: Colors.black,
                          labelPadding: EdgeInsets.zero,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: false,
                          controller: _tabController,
                          indicatorColor: Colors.transparent,
                          onTap: (index){ setState(() { tabIndex = index;});},
                          indicatorPadding: EdgeInsets.zero,
                          tabs: [
                            Tab(iconMargin: EdgeInsets.all(2),child: Icon(Icons.circle, size: 6, color: tabIndex == 0 ? Colors.black: Colors.transparent),  icon: Text("Motor-Siling",style: TextStyle(fontWeight: FontWeight.w600)),),
                            Tab(iconMargin: EdgeInsets.all(2),child: Icon(Icons.circle, size: 6,color: tabIndex == 1 ? Colors.black: Colors.transparent),  icon: Text("    Sai`ling    ",style: TextStyle(fontWeight: FontWeight.w600)),),
                            Tab(iconMargin: EdgeInsets.all(2),child: Icon(Icons.circle, size: 6,color: tabIndex == 2 ? Colors.black: Colors.transparent),  icon: Text("      Motor     ",style: TextStyle(fontWeight: FontWeight.w600)),),
                          ],
                        ),
                        quarterTurns: 3));
  }

  Widget buildBackgroundColor() {
    return Container(
          alignment: Alignment.centerRight,
          child: Container(width: 120, height: h, color: Color(0xfff5f1fb)),
        );
  }
}
