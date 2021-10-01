import 'package:flutter/material.dart';
import 'package:portfolio/screens/delivery/delivery_second_page.dart';

class DeliveryHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only( top: 80,),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //padding: EdgeInsets.only(left: 30, top: 80, right: 30),
                width: 350,
                height: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage("https://www.ascent24.io/wp-content/uploads/2020/08/unrtr.jpg")
                  ),
                  color: Colors.grey.shade200
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 40, top: 10),
                child: Text("Order your\nFavourite\nFood",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 40, top: 20),
                child: Text("Made by the finest Home Chefs, every\ndish raises the bar of Taste, Health,\nHygiene and cleanliness.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 40, top: 30, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Skip",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(icon: Icon(Icons.arrow_forward_ios),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliverySecondPage()));},
                      ),
                      backgroundColor: Colors.deepOrange,
                      radius: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
