import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:portfolio/data/coffee_data_list.dart';
import 'package:portfolio/screens/coffee_bar/coffee_info_page.dart';
import 'package:portfolio/models/coffee_model.dart';
import 'package:portfolio/screens/coffee_bar/bottom_nav_bar_items.dart';

class CoffeShopHomePage extends StatefulWidget {
  @override
  _CoffeShopHomePageState createState() => _CoffeShopHomePageState();
}

class _CoffeShopHomePageState extends State<CoffeShopHomePage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF151820),
      drawer: Drawer(),
      body: _bodyWithCustomScrollView(),
    );
  }

  //------------BODY-----------------

  _bodyWithCustomScrollView() => CustomScrollView(
        slivers: [_sliverAppBar(), _grid(), _getCoffeeListVertical()],
      );

  //------------Sliver APP BAR-----------------

  SliverAppBar _sliverAppBar() => SliverAppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size(_size.width, _size.height * 0.3),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Find the best \ncoffee for you",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60.0),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return CoffeeInfoPage();
                    //     },
                    //   ),
                    // );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    width: _size.width,
                    height: _size.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Find Your Coffee...",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                // _getCoffeeCategory(),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            width: 56.0,
            height: 56.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://source.unsplash.com/random"),
              ),
              border: Border.all(color: Colors.brown.shade500),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ],
      );

  //------------Sliver GRID-----------------

  SliverGrid _grid() => SliverGrid.count(
        childAspectRatio: 1.2,
        crossAxisCount: 1,
        children: [
          _getCoffeeList(),
        ],
      );

  // Coffee list'ni gorizontal holatda chiqarish uchun funksiya

  Container _getCoffeeList() => Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeList.length,
            itemBuilder: (context, index) {
              Coffee coffee = coffeeList[index];
              return _getCoffeeInfo(coffee);
            }),
      );

  /*
  Coffee haqidagi ma'lumotlarni ko'rsatadigan funksiya.
  Asosiy Vidget Container uning ichida Coffee'ning rasmi, nomi, tarkibi,
  narxi va boshqa ma'lumotlar bo'ladi
   */

  // Coffee'ning ma'lumotlarini ko'rsatadigan list uchun

  GestureDetector _getCoffeeInfo(Coffee coffee) => GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CoffeeInfoPage(coffee))),
    child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              width: _size.width * 0.36,
              height: _size.width * 0.36,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(coffee.rasmUrl),
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.deepOrangeAccent,
              ),
              child: Container(
                alignment: Alignment.center,
                width: 56.0,
                height: 26.0,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                ),
                child: Text(
                  "⭐ ${coffee.rating}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text(
              coffee.nomi,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Text(
              coffee.tarkib,
              style: TextStyle(
                color: Colors.white38,
                fontSize: 12.0,
              ),
            ),
            Container(
              width: _size.width * 0.36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "\$ ",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                        TextSpan(
                            text: "${coffee.narx}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12.0)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  List<String> _categoryList = [
    "Cappuccino",
    "Espresso",
    "Latte",
    "Ice Coffee"
  ];

  // Coffee`ning kategoriyalarini ko`rsatadi

  Container _getCoffeeCategory() => Container(
        height: _size.height * 0.05,
        width: _size.width * 1.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categoryList.length,
            itemBuilder: (context, index) {
              String cat = _categoryList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  cat,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: (index == 0) ? Colors.orange : Colors.white),
                ),
              );
            }),
      );

  SliverList _getCoffeeListVertical() => SliverList(
        delegate: SliverChildListDelegate(coffeeList.map(
              (coffee) => Container(
                width: _size.width * 1.0,
                height: _size.height * 0.16,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: _getCoffeeInfoVerticalChild(coffee),
              ),
            ).toList()),
      );

  // Container _getCoffeeInfoVertical(Coffee coffee) =>

  Row _getCoffeeInfoVerticalChild(Coffee coffee) => Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            height: _size.width * 0.25,
            width: _size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(coffee.rasmUrl)),
            ),
          ),
          Container(
              width: _size.width * 0.5,
              alignment: Alignment.topLeft,
              child: Text(
                "5 Coffee Beans You Must Try!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )),
        ],
      );

  /// Theme for bottom navigation bar
  Theme _getBottomNavBarTheme() => new Theme(
        child: bottomNavigationBarCoffee,
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black26,
        ),
      );
}
