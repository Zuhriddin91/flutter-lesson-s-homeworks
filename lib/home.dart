import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/models/page.dart';
import 'package:portfolio/data/page_list.dart';

class HomePageList extends StatefulWidget {
  @override
  _HomePageListState createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "My pages",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: showPageList(),
    );
  }

  Widget showPageList() {
    return ListView.builder(
        itemCount: pageList().length,
        itemBuilder: (context, index) {
          PageUI page = pageList()[index];
          return Card(
            color: Colors.black54,
            child: ListTile(
              leading: page.icon,
              title: Text(
                page.title,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                page.subtitle,
                style: TextStyle(color: Colors.white54),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
                size: 40.0,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => page.page));
              },
            ),
          );
        });
  }
}
