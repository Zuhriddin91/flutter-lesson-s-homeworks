import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DeliveryLastPage extends StatefulWidget {

  @override
  _DeliveryLastPageState createState() => _DeliveryLastPageState();
}

class _DeliveryLastPageState extends State<DeliveryLastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 24.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.clear), color: Colors.black, onPressed: () {},),
                    Text("Filter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Text("Reset all", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Distance", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Text(_sliderCount.toInt().toString() + "mi", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),),
                  ],
                ),
              ),
              Slider(
                value: _sliderCount,
                onChangeEnd: (e) {
                  print("Slider Tugadi " + e.toString());
                },
                onChanged: (v) {
                  setState(() {
                    _sliderCount = v;
                  });
                },
                //divisions: 8,
                min: 5,
                max: 15,
                activeColor: Colors.green,
                inactiveColor: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.only(left : 24.0, right: 24, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("5 ml", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600),),
                    Text("15 ml", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600),),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 24.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Text("\$${_priceSliderCountStart.toInt().toString()} - \$${_priceSliderCountEnd.toInt().toString()}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),),
                  ],
                ),
              ),
              RangeSlider(
                divisions: 16,
                values:
                    RangeValues(_priceSliderCountStart, _priceSliderCountEnd),
                onChanged: (v) {
                  setState(() {
                    _priceSliderCountStart = v.start;
                    _priceSliderCountEnd = v.end;
                  });
                },
                min: 0,
                max: 160,
                activeColor: Colors.green,
                inactiveColor: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ 00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600),),
                    Text("\$ 160", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600),),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left : 24.0, top: 20, right: 24),
                child: Text("Cuisine", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buttons("English"),
                    SizedBox(width: 15),
                    buttons("Chiness"),
                    SizedBox(width: 15),
                    buttons("Indian"),
                    SizedBox(width: 15),
                    buttons("Thai"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left : 24.0, top: 20, right: 24),
                child: Text("Diet", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buttons2("Paleo"),
                        SizedBox(width: 15),
                        buttons2("Kategoric"),
                        SizedBox(width: 15),
                        buttons2("Jollof Rich"),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buttons2("Banku"),
                        SizedBox(width: 15),
                        buttons2("Tuna Sandwich"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.all(20),
                //alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.deepOrange ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15,))),
                  onPressed: () {},
                  child: Text("Apply Filter", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttons(String text) => ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: (text == checkButton) ? Colors.white : Colors.grey),

      ),
      style: ElevatedButton.styleFrom( primary: (text == checkButton) ? Colors.green : Colors.white),
      onPressed: () {
        setState(() {
          checkButton = text;
        });
      },
  );

  Widget buttons2(String text) => ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: (text == checkButton2) ? Colors.white : Colors.grey),

      ),
      style: ElevatedButton.styleFrom( primary: (text == checkButton2) ? Colors.green : Colors.white),
      onPressed: () {
        setState(() {
          checkButton2 = text;
        });
      },
  );

  String checkButton = "";
  String checkButton2 = "";
  double _sliderCount = 5;
  double _priceSliderCountStart = 0, _priceSliderCountEnd = 0;
}
