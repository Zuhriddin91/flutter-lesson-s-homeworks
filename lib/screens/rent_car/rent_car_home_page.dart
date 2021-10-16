import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentCarHomePage extends StatefulWidget {
  @override
  _RentCarHomePageState createState() => _RentCarHomePageState();
}

class _RentCarHomePageState extends State<RentCarHomePage> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //appbardagi back buttonni yoqotish
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            actionsIconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.grey.shade200,
            elevation: 0,
            actions: [
              Icon(CupertinoIcons.text_alignleft),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.all(5),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://victor-mochere.com/wp-content/uploads/2019/02/Best-quotes-from-Jackie-Chan.jpg"))),
              ),
              SizedBox(width: 30),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(top: 20, left: 25, bottom: 10),
              title: Text(
                "Explore",
                style: TextStyle(color: Colors.black, fontSize: 28),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                height: 300,
                width: 400,
              ),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
