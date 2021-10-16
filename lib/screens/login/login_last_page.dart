import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class LoginLastPage extends StatelessWidget {
  Size? _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            rasmBolim(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                column("Applied", "28"),
                column("Reviewed", "73"),
                column("Contacted", "18"),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 30),
              child: Text("Complete Profile",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 10),
              alignment: Alignment.center,
              width: _size!.width,
              height: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  card(Colors.lightBlueAccent),
                  card(Colors.orangeAccent),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Buy Pro \$23.49",
                  style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.underline,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget card(rang) => Container(
      height: 200,
      width: 155,
      decoration: BoxDecoration(
        color: rang,
        borderRadius: BorderRadius.circular(15)
      ),
      );
  
  Widget appBar() => Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: _size!.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Back",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
      );

  Widget rasmBolim() => Container(
        width: _size!.width,
        height: 250,
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              alignment: Alignment(1, 0.6),
              child: Container(
                width: 500,
                height: 120,
                transform: Matrix4.rotationZ(50),
                color: Color(0xffc20039),
              ),
            ),
            Container(
              color: Colors.transparent,
              alignment: Alignment(1, 0),
              child: Container(
                width: 40,
                height: 250,
                color: Colors.white,
              ),
            ),
            Container(
              color: Colors.transparent,
              alignment: Alignment(-1, 0),
              child: Container(
                width: 40,
                height: 250,
                color: Colors.white,
              ),
            ),
            Container(
              color: Colors.transparent,
              alignment: Alignment(0, 0.6),
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://static.highsnobiety.com/thumbor/yN_r8gNW5phGFRdQl_m-uvJyxFw=/fit-in/1200x720/smart/static.highsnobiety.com/wp-content/uploads/2019/07/18145533/best-nigerian-rappers-02.jpg"))),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40)),
                    alignment: Alignment(1.1, -1.0),
                    // ----- ICON--------
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff90d4ec),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget column(text1, text2) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ],
      );
}
