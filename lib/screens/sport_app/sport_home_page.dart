import 'package:flutter/material.dart';
import 'package:portfolio/models/sport_model.dart';
import 'package:portfolio/data/sport_data_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/screens/sport_app/sport_second_page.dart';

class SportHomePage extends StatefulWidget {
  @override
  _SportHomePageState createState() => _SportHomePageState();
}

class _SportHomePageState extends State<SportHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.white24, Color(0x2DB092F0)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Text(
                          "Hey Brian,",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.wsj.net/im-355811?width=860&height=573')),
                            borderRadius: BorderRadius.circular(15)),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "What are you \nup to today?",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    width: double.infinity,
                    height: 430,
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.25,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 18),
                      itemBuilder: (context, index) {
                        SportType sportType = sportTypeList[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: sportType.color,
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.all(8),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                sportType.type,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.bottomRight,
                                image: NetworkImage(sportType.imageUrl),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              height: 0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, bottom: 20.0, right: 30),
              child: setBottomNavigationIcon(),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }

  Widget setBottomNavigationIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () => Navigator.pop(context),
            icon: _setIcon(Icons.home_filled, Colors.black)),
        _setIcon(CupertinoIcons.chart_bar, Colors.grey),
        IconButton(
            icon:
                Icon(CupertinoIcons.chat_bubble_text_fill, color: Colors.grey),
            onPressed: () => _onItemTap),
        _setIcon(CupertinoIcons.person_2, Colors.grey),
        GestureDetector(
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.wsj.net/im-355811?width=860&height=573')),
                borderRadius: BorderRadius.circular(10)),
          ),
          onTap: () => _onTap(),
        ),
      ],
    );
  }

  _onItemTap() => Fluttertoast.showToast(msg: "you clicked");

  _onTap() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => SportSecondPage()));

  Widget _setIcon(icon, color) => Icon(icon, color: color);
}