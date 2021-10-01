import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChatHomeWork extends StatefulWidget {
  // const ChatHomeWork({Key? key}) : super(key: key);

  @override
  _ChatHomeWorkState createState() => _ChatHomeWorkState();
}

class _ChatHomeWorkState extends State<ChatHomeWork> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: Color(0xff1c003e),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    "Activity",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TabBar(
                    tabs: [
                      tabItem(tabNames[0]),
                      tabItem(tabNames[1]),
                      tabItem(tabNames[2]),
                      tabItem(tabNames[3])
                    ],
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    onTap: (i){
                      setState(() {
                        activeTab = i;
                      });
                    },
                  ),
                ),
                Container(
                  height: 659,
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index){
                        return Container(
                          height: 90,
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff360062),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: ListTile(
                            title: Text("Shoping", style: TextStyle(color: Colors.white),),
                            subtitle: Text("June 20, 3:41pm",style: TextStyle(color: Colors.white38),),
                            trailing: Text("-\$16.35", style: TextStyle(color: Colors.white70),),
                            leading: Container(
                              height: 50, width: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                              color: Color(0xff360062),
                              image: DecorationImage(fit: BoxFit.cover,
                              image: NetworkImage("https://source.unsplash.com/random"))),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  tabItem(text) =>Container(
                      alignment: Alignment.center,
                      width: 85,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: text == tabNames[activeTab] ? Colors.amberAccent: Color(0xff360062),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(text, style: TextStyle(color: text == tabNames[activeTab]  ? Colors.black: Colors.purpleAccent[100],),),
                    );

  List<String> tabNames = ["All","Shoping", "Taxi", "Transport",];
  int activeTab = 0;
}
