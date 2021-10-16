import 'package:flutter/material.dart';
import 'package:portfolio/screens/furniture_shop/furnish_shop_home_page.dart';

class FurnishSecondPage extends StatefulWidget {
  @override
  _FurnishSecondPageState createState() => _FurnishSecondPageState();
}

class _FurnishSecondPageState extends State<FurnishSecondPage>
    with TickerProviderStateMixin {
  double? w;
  double? h;
  TabController? _tabController;
  int _currentIndex = 0;
  bool check = true;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    _tabController!.addListener(() {
      setState(() => _currentIndex = _tabController!.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            buildAppBar(),
            buildImage(),
            Container(
              width: w,
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yellow Chair",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Dimension H:33 x W:19 x D:21 Seming Height: Height 179\nAll dimensions are in INCH",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.orange,
                        ),
                        Text(
                          " 4.9 | 239 Reviews",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Container(
                    width: w,
                    height: 40,
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Text("Spefications"),
                        Text("Care"),
                        Text("FAQ's"),
                        Text("Shipping"),
                        Text("Terms"),
                        Text("Warrent"),
                      ],
                      labelColor: Color(0xff41c2d3),
                      unselectedLabelColor: Colors.black,
                      labelPadding: EdgeInsets.zero,
                      physics: ScrollPhysics(),
                      labelStyle:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      indicatorColor: Color(0xff41c2d3),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Dimensions:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                  SizedBox(height: 10),
                  Text(
                    "Dimension H:33 x W:19 x D:21 Seming Height: Height 179\nAll dimensions are in INCH",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text("Material:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                  Stack(
                    children: [
                      Text(
                        "PolyPurulent Fabric buy a chair chair High Quality\nLetter",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 44),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Text(
                            "Buy Now!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: h! * 0.4,
      width: w,
      child: Image.network(
        "https://luxloungeefr.com/wp-content/uploads/2015/03/blue-custom.png",
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.grey),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FurnishHomePage()));
              }),
          IconButton(
            icon: Icon(check ? Icons.star_border : Icons.star,
                color: Colors.grey),
            onPressed: () {
              check = !check;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

