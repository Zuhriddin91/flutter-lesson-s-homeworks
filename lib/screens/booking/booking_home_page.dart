import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/hotel_data_list.dart';
import 'package:portfolio/models/hotel_model.dart';
import 'package:portfolio/screens/booking/booking_filter.dart';

class BookingHomePage extends StatefulWidget {
  @override
  _BookingHomePageState createState() => _BookingHomePageState();
}

class _BookingHomePageState extends State<BookingHomePage> {
  List<String> topScrollNames = ["Near by", "Paris", "Switzeland", "New Dehli",];
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          builtopScroll(),
          buildScrollTitle("POPULAR DESTINATION"),
          buildScroll(cardWidth:  width - 32),
          buildScrollTitle("NEW HOTEL"),
          buildScroll(cardWidth: width / 2.5),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        selectedLabelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        currentIndex: bottomCurrentIndex,
        onTap: (i) => setState(() => bottomCurrentIndex = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "My Trip"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],

      ),
    );
  }

  int bottomCurrentIndex = 0;

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Location",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jemberaya",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {Navigator.push(context,
          MaterialPageRoute(builder: (context)=> BookingFilter()));},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                "assets/images/filterIcon.png",
                height: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget builtopScroll() {
    return Container(
          height: 130,
          //color: Colors.grey,
          child: ListView.builder(
              itemCount: 4,
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              physics:  BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 70,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 1, blurRadius: 1)],
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(fit: BoxFit.cover,
                            image: NetworkImage(topScrollImg[index]),)
                        ),
                      ),
                      Text(topScrollNames[index], style: TextStyle(fontWeight: FontWeight.w700),)
                    ],
                  )),
        );
  }

  Widget buildScrollTitle(title) {
    return Container(
          width: width,
          padding: EdgeInsets.only(left: 16, top: 24),
          height: 60,
          child: Text(
            title,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
          ),
        );
  }

  Widget buildScroll({@required cardWidth}) {
    return Container(
          width: width,
          height: 200,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemExtent: cardWidth,
            itemCount: hotelData.length,
            itemBuilder: (context, index) {
              Hotel hotel = hotelData[index];
              return Container(
                margin: EdgeInsets.only(right: 10, bottom: 8),
                padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                //elevation: 2,
                child: Stack(
                  children: [
                    if(cardWidth > width /2 ) Positioned(
                      top: 5,
                      right: 0,
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xfffd5a3c),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$${hotel.cost}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              "Per Night",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.hotelName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: cardWidth > width/2 ? 22: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "⭐⭐⭐⭐⭐ (${hotel.hotelRate})",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: cardWidth > width/2 ?15 : 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      hotel.imageUrl
                    ),
                  ),
                ),
              );
            },
          ),
        );
  }
}
