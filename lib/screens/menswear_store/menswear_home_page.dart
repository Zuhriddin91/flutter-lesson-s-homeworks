import 'package:flutter/material.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/screens/menswear_store/menswear_second_page.dart';

class MensWearHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MensWearSecondPage()));},
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "REPRESENT",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search, size: 30),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 15),
              width: double.infinity,
              height: 450,
              child: Text(
                "FW19",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 50,
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    scale: 2,
                    image: NetworkImage(
                        "https://mostpop.cafe24.com/web/upload/Editorial/190807/190807_09.jpg")),
                color: Colors.grey.shade300,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 420,
              child: Text(
                "THE    \n TERRIER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 50,
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    scale: 2,
                    image: NetworkImage(
                        "https://ae01.alicdn.com/kf/HTB195EgmL9TBuNjy0Fcq6zeiFXaA/Bravover-Men-Shoes-Casual-Sneakers-High-Top-Fashion-Footwear-Male-Cool-High-Top-Shoes-High-Quality.jpg_Q90b.jpg")),
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
