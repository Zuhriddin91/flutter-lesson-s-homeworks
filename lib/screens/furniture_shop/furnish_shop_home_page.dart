import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FurnishHomePage extends StatefulWidget {
  @override
  _FurnishHomePageState createState() => _FurnishHomePageState();
}

class _FurnishHomePageState extends State<FurnishHomePage> with TickerProviderStateMixin{
  double w, h;
  TabController _tabController;
  int _bottomIndex = 0;
  ScrollController _controller;


  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, );
    _tabController.addListener(() {
      debugPrint('${_tabController.indexIsChanging}');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
       // physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(),
            buildTabBar(),
            buildTabBarView(),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container buildAppBar() {
    return Container(
      width: w,
      height: 210,
      child: Stack(
        children: [
          Container(
            width: w,
            height: 190,
            decoration: BoxDecoration(
              color: Color(0xfffd9c01),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Furniture that fits\nyour Style",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: w - 30,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                scrollPadding: EdgeInsets.all(5),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.blueAccent,
                    ),
                  ),
                  hintText: "Search Furniture",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildTabBar() {
    return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: w,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop for",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              width: w,
              height: 100,
              color: Colors.transparent,
              child: TabBar(
                physics: ScrollPhysics(),
                controller: _tabController,
                tabs: [
                  Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                        "assets/images/furniture/chair.png",
                        fit: BoxFit.scaleDown,
                      ),
                        flex: 5,
                      ),
                      Text(
                        "Chair",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child:Image.asset(
                        "assets/images/furniture/bed.png",
                        fit: BoxFit.scaleDown,
                      ),
                        flex: 5,
                      ),
                      Text(
                        "Bed",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                        "assets/images/furniture/sofa.png",
                        fit: BoxFit.scaleDown,
                      ),
                        flex: 5,
                      ),
                      Text(
                        "Sofa",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                        "assets/images/furniture/table.png",
                        fit: BoxFit.scaleDown,
                      ),
                        flex: 5,
                      ),
                      Text(
                        "Table",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
                indicatorColor: Colors.red,
                onTap: (i){
                  setState(() {
                    _tabIndex = i;
                  });
                },

              ),
            ),
            Divider(height: 20, endIndent: 15, indent: 15, thickness: 1),
          ],
        );
  }

  Container buildTabBarView() {
    return Container(
            width: w,
            height: 300,
            child: TabBarView(

              controller: _tabController,
              children: [
                buildScrollCard(),
                buildScrollCard(),
                buildScrollCard(),
                buildScrollCard(),
              ],
            ),
          );
  }

  Column buildScrollCard() {
    return Column(children: [
          Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.symmetric(vertical: 10),
                width: w, height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Today's Deals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text("See All", style: TextStyle(color: Colors.blueAccent,  fontSize: 15),),
                ],),
              ),
        Container(
          width: w,
          height: 220,
          color: Colors.transparent,
          child: ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemExtent: 300,
            itemBuilder: (context, index) => Card(
              elevation: 2,
              margin: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${tabNames[_tabIndex]} Starting from\n\$39.99",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "Ends in 02.00.25",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.grey,fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/images/furniture/${tabNames[_tabIndex].toLowerCase()}.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Shop"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),],
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey ,
      type: BottomNavigationBarType.shifting,
      currentIndex: _bottomIndex,
      onTap: (index) {
        setState(() {
          _bottomIndex = index;
        });
      },
    );
  }

  List<String> tabNames = ["Chair", "Bed", "Sofa", "Table"];

  int _tabIndex = 0;
}
