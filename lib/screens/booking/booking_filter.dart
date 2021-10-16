import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BookingFilter extends StatefulWidget {
  @override
  _BookingFilterState createState() => _BookingFilterState();
}

class _BookingFilterState extends State<BookingFilter> {
  double? width, height;
  double _priceSliderCountStart = 1000, _priceSliderCountEnd = 2000;
  List<bool> check = [false, false, false];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(context),
          builSliderContainer(),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: width,
            height: 180,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Free Break Fast", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      IconButton(onPressed: (){
                        setState(() {
                          check[0] = !check[0];
                        });
                      },icon: Icon(Icons.check, color: (check[0] == true )? Colors.green: Colors.grey,))
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Free WiFi", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      IconButton(onPressed: (){
                        setState(() {
                          check[1] = !check[1];
                        });
                      },icon: Icon(Icons.check, color: (check[1] == true )? Colors.green: Colors.grey,))
                    ],
                  ),
                ),
                Divider(thickness: 10),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Sunrise check-in", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      IconButton(onPressed: (){
                        setState(() {
                          check[2] = !check[2];
                        });
                      },icon: Icon(Icons.check, color: (check[2] == true )? Colors.green: Colors.grey,))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget builSliderContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: width,
      height: 180,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      //alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$ Price",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          RangeSlider(
            values: RangeValues(_priceSliderCountStart, _priceSliderCountEnd),
            onChanged: (v) {
              setState(() {
                _priceSliderCountStart = v.start;
                _priceSliderCountEnd = v.end;
              });
            },
            min: 0,
            max: 3000,
            divisions: 6,
            activeColor: Colors.deepOrange,
            labels: RangeLabels(
                "${_priceSliderCountStart}", "${_priceSliderCountEnd}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (width! - 50) / 2,
                height: 40,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: Text("Min: ${_priceSliderCountStart.toInt()}",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Container(
                width: (width! - 50) / 2,
                height: 40,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: Text("Max: ${_priceSliderCountEnd.toInt()}",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Container(
      width: width,
      height: 100,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 50, 16, 16),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          Text(
            "Filter",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            "CLEAR",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }


}
