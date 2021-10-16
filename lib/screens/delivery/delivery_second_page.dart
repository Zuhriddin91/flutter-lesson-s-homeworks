import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/delivery_data_list.dart';
import 'package:portfolio/models/delivery_food_model.dart';
import 'package:portfolio/screens/delivery/delivery_last_page.dart';

class DeliverySecondPage extends StatefulWidget {
  @override
  _DeliverySecondPageState createState() => _DeliverySecondPageState();
}

class _DeliverySecondPageState extends State<DeliverySecondPage> {
  Size? _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            appBar2(),
            median(),
            gridView(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNawBar(context),
    );
  }

  appBar2() => SliverToBoxAdapter(
    child: Container(
      width: _size!.width,
      height: 325.0,
      //color: Colors.pink,
      child: Stack(
        children: [
          Container(
            width: _size!.width,
            height: _size!.width * 0.67,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only( bottomRight: Radius.circular(40), bottomLeft:  Radius.circular(40))
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, Burhan", style: TextStyle(color: Colors.white, fontSize: 20),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Good Morning ", style: TextStyle(color: Colors.white, fontSize: 14),),
                            Icon(Icons.wb_sunny_outlined, size: 15, color: Colors.white,)
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: Colors.white54,
                          ),
                          child: Icon(Icons.my_location_sharp, color: Colors.white,),
                        ),
                        SizedBox(height: 5,),
                        Text("Map View", style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: _size!.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5), // Shadow position
                          ),
                        ],
                      ),
                  child: ListTile(
                    leading: Icon(Icons.search, color: Colors.grey,),
                    title: Text("Search", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    trailing: IconButton( onPressed: (){setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DeliveryLastPage();
                      }));
                    });},icon: Image.asset("assets/images/filterIcon.png", height: 30,)),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: _size!.width,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5), // Shadow position
                          ),
                        ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("30%", style: TextStyle(color: Colors.deepOrange, fontSize: 40,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text("Discount for All Food", style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Valid until November 16", style: TextStyle(color: Colors.grey, fontSize: 14),),
                        ],
                      ),
                      Image.asset("assets/images/eggSousage.png", width: 120,)
                    ],
                ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );

  median() => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "Popular Chef",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    IconButton(
                        icon: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.grey,
                    ), onPressed: () {  },),
                    IconButton(
                        icon: Icon(
                      Icons.grid_view,
                      size: 30,
                      color: Colors.grey,
                    ), onPressed: () {  },)
                  ],
                ),
              ),
            );

  gridView() => SliverPadding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 1.05,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              DeliveryFood food = foodList[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Color(0xFFF9AFCF),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(food.imageUrl),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    food.desciption,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  Icon(
                                    Icons.delivery_dining,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              );
            },
            childCount: foodList.length,
          ),
        ),
      );
  
  Widget _bottomNawBar(context) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30,),
            label: 'Search',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view, size: 30,color: Colors.grey,),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined,size: 30,color: Colors.grey,),
            label: 'History',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline,size: 30,color: Colors.grey,),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,size: 30,color: Colors.grey,),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        //onTap: () {},
      );
}
