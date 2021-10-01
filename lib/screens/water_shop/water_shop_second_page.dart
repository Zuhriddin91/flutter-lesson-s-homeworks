import 'package:flutter/material.dart';

class WaterShopSecondPage extends StatefulWidget {

  @override
  _WaterShopSecondPageState createState() => _WaterShopSecondPageState();
}

class _WaterShopSecondPageState extends State<WaterShopSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Basket", style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
      ),
      body: Container(color: Colors.white,),
    );
  }
}
