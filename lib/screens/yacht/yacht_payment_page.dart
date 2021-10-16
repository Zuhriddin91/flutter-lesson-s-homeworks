import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YachtPaymentPage extends StatefulWidget {
  @override
  _YachtPaymentPageState createState() => _YachtPaymentPageState();
}

class _YachtPaymentPageState extends State<YachtPaymentPage> with TickerProviderStateMixin{
  double? height, width, cardWidth =130, cardMargin = 30;
  Color? pColor;
  int days = 1, tabIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    pColor = Theme.of(context).primaryColor;



    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(),
            buildTopText(),
            buildTopCostRow(),
            buildTextPaymentCards(),
            buildCardScroll(),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(50, 50, 10, 0),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30),
                  height: 60,
                  width: width! - 140,
                  decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("Play now",style: TextStyle(color: Colors.white,
                  fontSize: 17, fontWeight: FontWeight.bold),),
                ),
                Container(
                  margin: EdgeInsets.only(top:50),
                  alignment: Alignment.center,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Image.asset("assets/images/yacht/face_id.png", color: Colors.white, height: 40,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardScroll() {
    return Container(width: width, height: 320,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 40),
            child: TabBar(
              //padding: EdgeInsets.symmetric(horizontal: 50),
              //scrollDirection: Axis.horizontal,
              //itemExtent: 200,
              isScrollable: true,
              controller: _tabController,
              labelPadding: EdgeInsets.all(10),
              indicatorColor: Colors.transparent,
              tabs: [
                cardMark(0,"**** 2293", "\$23 890", "Platinum","assets/images/yacht/mastercard.png"),
                cardMark(1, "**** 3456", "\$15 000", "Debit","assets/images/yacht/visa.png"),
                cardMark(2, "**** 5577", "\$13 999", "Gold","assets/images/yacht/mastercard.png"),
            ],
            onTap: (index) => setState(() => tabIndex = index),
            ),
            );
  }

  Widget cardMark( cardindex, cardNumber, summ, cardType, cardImg) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: tabIndex == cardindex ? 20 : 50),
      width: tabIndex == cardindex ? 170 : 130,
      decoration: BoxDecoration(
           boxShadow:  [
             tabIndex == cardindex ?
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 4,
              offset: Offset(2,4)
                ): BoxShadow(color: Colors.transparent)
          ],
          color: tabIndex == cardindex ? pColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (tabIndex == cardindex)
                RotatedBox(
                    quarterTurns: 3,
                    child: Image.asset(
                      "assets/images/yacht/chip.png",
                      height: 25,
                    )),
              Text(
                cardNumber,
                style: TextStyle(
                    color: tabIndex == cardindex ? Colors.white : Colors.black,
                    fontSize: 18),
              )
            ],
          ),
          Spacer(flex: 8),
          Text(
            summ,
            style: TextStyle(
                color: tabIndex == cardindex ? Colors.white : Colors.black,
                fontSize: 24),
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cardType,
                style: TextStyle(
                    color: tabIndex == cardindex ? Colors.white70 : Colors.grey,
                    fontSize: 14),
              ),
              Image.asset(
                cardImg,
                height: tabIndex == cardindex ? 30 : 22,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextPaymentCards() {
    return Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              top: 40,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Payment",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " Cards",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          );
  }

  Widget buildTopCostRow() {
    return Row(
      children: [
        SizedBox(width: 40),
        Container(
          height: 100,
          width: (width! - 41) / 2,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Days",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                width: 130,
                height: 50,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: pColor, borderRadius: BorderRadius.circular(23)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.minus,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            if (days > 0) days--;
                          });
                        }),
                    Text(
                      "$days",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.plus_circle_fill,
                          color: Colors.white,
                          size: 34,
                        ),
                        onPressed: () {
                          setState(() {
                            if (days < 30) days++;
                          });
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(width: 1, height: 80, color: Colors.grey),
        Container(
          height: 100,
          width: (width! - 41) / 2,
          padding: EdgeInsets.only(right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Total",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 10),
                child: Text(
                  "\$${days * 1000}",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopText() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, top: 20, bottom: 40),
      child: Text(
        "Checkout",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left:40.0),
        child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
