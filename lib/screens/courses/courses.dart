import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/courses_data_list.dart';
import 'package:portfolio/models/courses_model.dart';

class Courses extends StatelessWidget {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          elevation: 2,
          toolbarHeight: _size.width * 0.6,
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.only(top: 160.0, left: 20),
            child: Text(
              "Home",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 26),
            ),
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                      foregroundImage: NetworkImage("https://www.nme.com/wp-content/uploads/2019/03/michaeljackson-GettyImages-90424819-696x442.jpg"),
                      backgroundColor: Colors.grey.shade600, radius: 40),
                ),
              ],
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            _listViewMark(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Popular Courses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _listViewMark2(),
          ],
        ),
        bottomNavigationBar: _bottomNawBar(context),
      ),
    );
  }

  Widget _listViewMark() => SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: _size.width,
          height: _size.width * 0.65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemExtent: 300,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Shonda Rhymes",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                    Text(
                      "Shonda describle what fuels her passion.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl[index]),
                  ),
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),
      );

  Widget _listViewMark2() => SliverToBoxAdapter(
            child: Container(
              width: _size.width,
              height: 330,
              child: ListView.builder(
                  itemCount: courseList.length,
                  itemExtent: 280,
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    CourseClass course = courseList[index];
                    return Container(
                      margin: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child:
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(course.image),
                                    )
                                  ),
                                )
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: 300,
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Text(
                                    course.name,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    course.description,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.2,
                              color: Colors.grey.shade500,
                              offset: Offset(0.0, 0.0), //(x,y)
                              blurRadius: 2.0,
                            ),
                          ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },),
            ),
          );

  Widget _bottomNawBar(context) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.home_filled),
            onPressed: (){
            return Navigator.pop(context);
            }
            ),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        //onTap: () {},
      );
}
