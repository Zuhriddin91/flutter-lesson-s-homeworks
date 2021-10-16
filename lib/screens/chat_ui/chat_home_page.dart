import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/account_data_list.dart';
import 'package:portfolio/screens/chat_ui/chat_homework.dart';

class ChatHomePage extends StatefulWidget {
  @override
  _ChatHomePageState createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomItem == 3 ? _accountBody() : _chatBody(),
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButton: bottomItem == 3
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatHomeWork()));
              },
              child: Icon(CupertinoIcons.chat_bubble_text_fill),
            ),
    );
  }

  String _checkbutton = "";
  int? indeks;
  int bottomItem = 0;

  _accountBody() => SafeArea(

        child: SingleChildScrollView(
          child: Container(

            //padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Icon(
                        Icons.search,
                        size: 26,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Container(
                  height: 65,
                  alignment: Alignment.center,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      foregroundImage: NetworkImage(
                          "https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo="),
                    ),
                    title: Text("Adina Nurrahma"),
                    subtitle:
                        Text("Trust your feeling, be a good\nhuman beings"),
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    child: SwitchListTile(
                      secondary: Icon(CupertinoIcons.moon_fill),
                      title: Text("Dark mode"),
                      value: check,
                      onChanged: (v) {
                        setState(() {
                          check = v;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: ExpansionTile(
                          title: Text(_listOfTitle[index]),
                          leading: _listOfLeadinIcon[index],
                          trailing: _listOfIcon[index],
                          children: [
                            Container(
                              height: 100,
                              child: Text("Hello Contact $index"),
                            ),
                          ],
                          onExpansionChanged: (v) {
                            setState(
                              () {
                                if (v) {
                                  _listOfIcon[index] =
                                      Icon(Icons.keyboard_arrow_up);
                                } else {
                                  _listOfIcon[index] =
                                      Icon(Icons.keyboard_arrow_down);
                                }
                              },
                            );
                          },

                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  List<Icon> _listOfIcon =
      List.generate(20, (index) => Icon(Icons.keyboard_arrow_down));
  List<Icon> _listOfLeadinIcon = [
    Icon(Icons.account_box),
    Icon(Icons.notifications),
    Icon(Icons.chat_bubble),
    Icon(Icons.sim_card_outlined),
    Icon(Icons.lock),
    Icon(Icons.info)
  ];
  List<String> _listOfTitle = [
    "Account",
    "Notification",
    "Chat settings",
    "Data and storage",
    "Privacy and security",
    "About"
  ];

  _chatBody() => SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Recent Chats",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  Icon(
                    Icons.search,
                    size: 26,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    _buttonMark("All chats"),
                    SizedBox(width: 10),
                    _buttonMark("Personal"),
                    SizedBox(width: 10),
                    _buttonMark("Work"),
                    SizedBox(width: 10),
                    _buttonMark("Groups"),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: accounts.length,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ListTile(
                    minVerticalPadding: 10,
                    leading: Container(
                      height: 60,
                      width: 58,
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(accounts[index].imageUrl))),
                    ),
                    tileColor: indeks == index
                        ? Colors.blue[50]
                        : Colors.grey.shade100,
                    title: Text(
                      accounts[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      accounts[index].subtitle,
                      style: TextStyle(),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          accounts[index].activeTime,
                          style: TextStyle(),
                        ),
                        if (accounts[index].pinned)
                          Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.push_pin,
                              color: Colors.white,
                              size: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                          )
                      ],
                    ),
                    selectedTileColor: Colors.blue,
                    onTap: () {
                      setState(
                        () {
                          indeks = index;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  _buttonMark(text) => ElevatedButton(
        onPressed: () {
          setState(() {
            _checkbutton = text;
          });
        },
        child: Text(
          text,
          style: TextStyle(
              color: text == _checkbutton ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            primary: text == _checkbutton ? Colors.blue : Colors.white),
      );

  _bottomNavBar() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.clock_fill), label: "Clock"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone_fill), label: "Call"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle_fill), label: "Account"),
        ],
        onTap: (v) {
          setState(() {
            bottomItem = v;
          });
        },
        elevation: 5,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomItem,
      );
}
