import 'package:flutter/material.dart';
import 'cloth_store_second _page.dart';

class ClothStoreHomePAge extends StatefulWidget {
  @override
  _ClothStoreHomePAgeState createState() => _ClothStoreHomePAgeState();
}

class _ClothStoreHomePAgeState extends State<ClothStoreHomePAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 20, top: 60),
              alignment: Alignment.topRight,
              width: double.infinity,
              child: Text(
                "Log in",
                style: TextStyle(fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    "https://diversesystem.com/imagecache/product-details/17386/29920/crop_premiums-21-lpink-1-G5vS.jpg",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Color(0xFFEDDCD3),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Exceptional",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.w500)),
                    Text("Modern Clothings",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 40,
                    ),
                    Container(width: 60, height: 2, color: Colors.black),
                    SizedBox(height: 40),
                    Text("Shop for exceptional modern clothings",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                    Text("for your everyday life",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClothStoreSecondPage()),
                          (route) => false)

                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: 200.0,
                        child: Text("Go Shopping",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.grey.shade200)),
                        decoration: BoxDecoration(
                          color: Color(0xFF2E3D43),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 5,
                              color: Colors.grey.shade500,
                              offset: Offset(0.0, 7.0), //(x,y)
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      width: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              radius: 2, backgroundColor: Color(0xFF2E3D43)),
                          CircleAvatar(
                              child: CircleAvatar(
                                  child: CircleAvatar(
                                      radius: 2,
                                      backgroundColor: Color(0xFF2E3D43)),
                                  radius: 3,
                                  backgroundColor: Color(0xFFE0D8CB)),
                              radius: 4,
                              backgroundColor: Color(0xFF2E3D43)),
                          CircleAvatar(
                              radius: 2, backgroundColor: Color(0xFF2E3D43)),
                          CircleAvatar(
                              radius: 2, backgroundColor: Color(0xFF2E3D43)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
