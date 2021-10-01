import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:portfolio/screens/water_shop/water_shop_second_page.dart';
import 'package:portfolio/screens/water_shop/water_shop_slider_page.dart';

class WaterShopHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Water Shop",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 10),
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text(
                        "Search",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  padding: EdgeInsets.only(left: 10),
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/waterShop.jpg"))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Catalog",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "see all",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 18),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade600,
                      size: 13,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 170,
            width: 400,
            margin: EdgeInsets.only(top: 15),
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                width: 160,
                decoration: BoxDecoration(
                  color: contColor[index],
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text[index], style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),) ,
                    Container(
                      width: 134,
                      height: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: TextButton(
                        onPressed: () {
                          return Navigator.push(context, MaterialPageRoute(builder:
                          (context) {
                            return WaterShopSecondPage();
                          }));
                        },
                          child: Text("Show all", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),))
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.table_rows),
          label: "list"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view),
          label: "grid"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),
          label: "list"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),
          label: "list"),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        onTap: (i) {
          Navigator.push(context, MaterialPageRoute(builder: (context){return StepperExam();}));
        },
      ),
    );
  }

  List<Color> contColor = [
    Color(0xff00ccde),
    Color(0xfffd609b),
    Color(0xfff18161),
  ];

  List text = [
    "Bottles",
    "Coolers",
    "Types"
  ];
}
