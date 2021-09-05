import 'package:flutter/material.dart';
import 'package:portfolio/data/cloth_data_list.dart';
import 'package:portfolio/models/cloth_model.dart';

class ClothStoreSecondPage extends StatefulWidget {
  @override
  _ClothStoreSecondPageState createState() => _ClothStoreSecondPageState();
}

class _ClothStoreSecondPageState extends State<ClothStoreSecondPage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              stretch: true,
              //appbarning pasga choziluvchanligi
              floating: true,
              //appbar suzuvchanligi
              pinned: true,
              //appbar ekranda qoliw/qolmasligi
              elevation: 0,
              //backgroundColor: Colors.yellow,
              //collapsedHeight: 150,
              //expandedHeight: 150,
              //toolbarHeight: 70,,

              flexibleSpace: FlexibleSpaceBar(
                background: _containerForTitle(),
              ),
              bottom: PreferredSize(
                preferredSize: Size(_size.width, _size.height * 0.12),
                child: Container(
                  //color: Colors.amber,
                  height: _size.height * 0.12,
                  width: _size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: clothList.length,
                    itemBuilder: (ctx, index) {
                      Cloth cloth = clothList[index];
                      return Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Color(0xFFF9AFCF),
                              foregroundImage: NetworkImage(cloth.imagUrl),
                            ),
                            Text(cloth.name)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: _size.width * 1.3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        Cloth cloth = clothList[index];
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  width: _size.width * 0.9,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(cloth.imagUrl))),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  width: _size.width * 0.9,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 340.0),
                      child: Column(
                        children: [
                          Text(
                            "Modern",
                            style: TextStyle(
                                fontSize: 42.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: _size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Colors.black,
                                  width: 40,
                                  height: 2,
                                ),
                                Text(
                                  "Essentials",
                                  style: TextStyle(
                                      fontSize: 42.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  color: Colors.black,
                                  width: 40,
                                  height: 2,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Discover new styles",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _addCircleAvatar(
                                    Colors.white, Colors.black, Colors.black),
                                _addCircleAvatar(
                                    Colors.black, Colors.white, Colors.black),
                                _addCircleAvatar(
                                    Colors.white, Colors.black, Colors.black),
                                _addCircleAvatar(
                                    Colors.white, Colors.black, Colors.black),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Cloth cloth = clothList[index];
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9AFCF),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(cloth.imagUrl),
                        ),
                      ),
                    );
                  },
                  childCount: clothList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomForAppbar() => PreferredSize(
      preferredSize: Size(_size.width, _size.height * 0.15),
      child: Expanded(
        child: Container(
          color: Colors.pink,
          padding: const EdgeInsets.all(16.0),
          //   child:ListView(
          //   padding: EdgeInsets.all(5),
          //   itemExtent: 10,
          //   scrollDirection: Axis.horizontal,
          //   children: [
          //     CircleAvatar(
          //       backgroundColor: Colors.pink,
          //       radius: 10,
          //     ),
          //     CircleAvatar(
          //       backgroundColor: Colors.pink,
          //       radius: 10,
          //     ),
          //   ],
          // ),

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: _size.width * 0.2,
                  height: 80,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ],
            ),
          ),
        ),
      ));

  Widget _containerForTitle() => Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Milan",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              width: _size.width * 0.6,
              height: 1,
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            Text(
              "Search",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      );

  Widget _addCircleAvatar(tashqiRang, ortaRang, ichkiRang) => CircleAvatar(
      child: CircleAvatar(
          child: CircleAvatar(radius: 2, backgroundColor: ichkiRang),
          radius: 3.5,
          backgroundColor: ortaRang),
      radius: 5,
      backgroundColor: tashqiRang);
}
