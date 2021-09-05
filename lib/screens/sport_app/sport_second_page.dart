import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/models/sport_model.dart';
import 'package:portfolio/data/sport_data_list.dart';

class SportSecondPage extends StatelessWidget {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      return Navigator.pop(context);
                    }),
                Text(
                  "Statics",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              //padding: EdgeInsets.only(left: 10),
              width: _size.width,
              height: 105,
              child: ListView.builder(
                //itemExtent: 105,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  SportType sportType = sportTypeList[index];
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 67,
                          width: 87,
                          decoration: BoxDecoration(
                              color: sportType.color,
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Image(
                              image: NetworkImage(sportType.imageUrl),
                            ),
                          ),
                        ),
                        Text(
                          sportType.type,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  );
                },
                itemCount: sportTypeList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Latest Activities",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: _size.width,
              height: _size.height * 0.62,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 20, right: 12),
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://images.wsj.net/im-355811?width=860&height=573')),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Brian\n",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "May 02.2021 AT 07:02 PM",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25, top: 15),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: Icon(
                          Icons.directions_run,
                          color: Colors.yellowAccent,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                    child: Text(
                      "Morning Run",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        _rowMark("Distance", "31.00km"),
                        _rowMark("Evel Gain", "231m"),
                        _rowMark("Time", "2:23"),
                        _rowMark("Avg Page", "4:37/km"),
                      ],
                    ),
                  ),
                  Container(
                    width: _size.width,
                    height: _size.height * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.stack.imgur.com/1XPRz.png"))),
                  ),
                  Container(
                    width: _size.width,
                    height: 50,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "View Details ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                        Text(
                          " 10  ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        Icon(
                          CupertinoIcons.chat_bubble_text_fill,
                          color: Colors.grey,
                        ),
                        Text(
                          " 2",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 0,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePageList()),
                                  (route) => false);
                            },
                            icon: Icon(Icons.home_filled, color: Colors.black)),
                        Icon(CupertinoIcons.chart_bar, color: Colors.grey),
                        Icon(CupertinoIcons.chat_bubble_text_fill,
                            color: Colors.grey),
                        Icon(CupertinoIcons.person_2, color: Colors.grey),
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
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowMark(String text1, String text2) {
    return Container(
      alignment: Alignment.centerLeft,
      width: _size.width * 0.22,
      height: 55.0,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            text2,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
