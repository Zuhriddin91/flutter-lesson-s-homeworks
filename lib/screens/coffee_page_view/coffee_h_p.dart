import 'package:flutter/material.dart';
import 'package:portfolio/data/coffee_second_data.dart';
import 'package:portfolio/models/cofee_second_model.dart';

class CofeePageView extends StatefulWidget {
  @override
  _CofeePageViewState createState() => _CofeePageViewState();
}

class _CofeePageViewState extends State<CofeePageView>  with TickerProviderStateMixin{
  TabController? _tabController;
  int? indeks;
  Size? size;
  @override
  void initState() {
    _tabController = TabController(length: cofeeList.length, vsync: this);
    _tabController!.addListener(() { setState(() {
     indeks = _tabController!.index ;
    });});
    super.initState();
  }

    @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe6dede),
      body: Stack(
        children: [
          selectCofee(),
          //tabBar(),
          bottomRow(),
          //tabBar()
        ],
      ),
    );
  }

  Widget selectCofee() {
    return Positioned(
      top: 80,
      left: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "Coffee",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 35),
          Row(
            children: [
              scrollPoint(20, Colors.black),
              scrollPoint(5, Colors.grey),
              scrollPoint(5, Colors.grey),
              scrollPoint(5, Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget scrollPoint(double width, Color color) {
    return Container(
      margin: EdgeInsets.all(3),
      height: 5,
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
    );
  }

  Widget tabBar() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 250),
      width: size!.width,
      height: 480,
      color: Colors.transparent,
      child: TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: [
          buildCard(),
          buildCard(),
          buildCard(),
        ],
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        onTap: (index) {debugPrint("$index");},
      ),
    );
  }

  Stack buildCard() {
    return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 35, bottom: 15),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: Image.asset(
                      "assets/images/coffee.jpg",
                      height: 270,
                      width: 270,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 50),
                    child: Text(
                      "koffee.title",
                      style: TextStyle(
                          color: Color(0xffa1743b),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "kofeesubtitle",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 44,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: Container(
                alignment: Alignment.center,
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      " price",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
  }

  Widget coffeeCardScroll() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 250),
      width: size!.width,
      height: 480,
      color: Colors.transparent,
      child: buildCard()
    );
  }

  Widget tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        tabBarViewChild(),
        tabBarViewChild(),
        tabBarViewChild()
      ],
    );
  }

  Widget tabBarViewChild() => Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 35, bottom: 15),
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: Image.asset(
                      "assets/images/coffee.jpg",
                      height: 270,
                      width: 270,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 50),
                    child: Text(
                      "qqqqqq",
                      style: TextStyle(
                          color: Color(0xffa1743b),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "sssss",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 44,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: Container(
                alignment: Alignment.center,
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "www",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );

  Widget bottomRow() {
    return Padding(
      padding: EdgeInsets.only(top: size!.height * 0.9, left: 60),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_outlined),
            ),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            width: 260,
            height: 80,
            color: Colors.white,
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Text(
                    "Cappuchino",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text(
                    "Americano",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              isScrollable: true,
            ),
          )
        ],
      ),
    );
  }
}
