import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/yacht/yacht_payment_page.dart';

class YachtInfoPage extends StatefulWidget {
  @override
  _YachtInfoPageState createState() => _YachtInfoPageState();
}

class _YachtInfoPageState extends State<YachtInfoPage> {
  double? height, width;
  bool follow = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: PreferredSize(
        preferredSize: Size(width!, height!),
        child: Column(
          children: [
            SafeArea(child: buildAppBar()),
            Row(
              children: [
                buildLeftColumn(),
                buildImage(),
              ],
            ),
            buildBottomButton(context)
          ],
        ),
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
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
        ),
        IconButton(
            icon: Icon(
              follow ?  Icons.favorite_border: Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () => setState(() => follow = !follow )),
      ],
    );
  }

  Widget buildImage() {
    return Container(
                  margin: EdgeInsets.only(top: 20),
                  width: width! / 2,
                  height: height! - 200,
                  //alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/yacht/yacht_1.2.png", fit: BoxFit.fitHeight),
    );
  }

  Widget buildLeftColumn() {
    return Container(
      padding: const EdgeInsets.only(left: 50,top: 10),
      margin: EdgeInsets.only(top: 20),
      width: width! / 2,
      height: height! - 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Atlantida",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "Yacht",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(height: 30),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$1000 ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                TextSpan(
                  text: "/ day",
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          buildInfoCard("74", "Lenghts", 70, CupertinoIcons.resize_h),
          buildInfoCard("25", "Hight", 20, CupertinoIcons.resize_v),
          buildInfoCard("90", "Draft", 20, CupertinoIcons.resize),
        ],
      ),
    );
  }

  Widget buildInfoCard(text1, text2, double margin, icon) {
    return Container(
          margin: EdgeInsets.only(top: margin),
          padding: EdgeInsets.fromLTRB(20,10,15,20),
          width: 145, height: 115,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white54, width: 1)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Icon(
                  (icon),
                  color: Colors.white54,
                ),
                alignment: Alignment.centerRight,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$text1 ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                      text: "m",
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                text2,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
  }

  Widget buildBottomButton(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 20, 20, 0),
      padding: EdgeInsets.only(left: 30, right: 8),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("Rent now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
          ),
          child: IconButton(icon: Icon(Icons.arrow_forward,), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> YachtPaymentPage()));
          }),
        ),

      ],),
    );
  }
}
