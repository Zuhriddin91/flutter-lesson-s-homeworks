import 'package:flutter/material.dart';

class MensWearSecondPage extends StatefulWidget {
  @override
  _MensWearSecondPageState createState() => _MensWearSecondPageState();
}

class _MensWearSecondPageState extends State<MensWearSecondPage> {
  Size? _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "FW19",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 24,
              fontStyle: FontStyle.italic),
        ),
        actions: [
          IconButton(
              onPressed: () {setState(() => ifGrid = false);},
              icon: Icon(
                Icons.crop_square,
                size: 30,
                color:  ifGrid ? Colors.grey : Colors.black,
              )),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.grid_view,
                size: 30,
                color: ifGrid ? Colors.black : Colors.grey,
              ),
              onPressed: () {setState(() => ifGrid = true);},
            ),
          ),
        ],
      ),
      body: ifGrid ? _gridView() : _singleViev(),
    );
  }

  Widget _singleViev() => Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            Container(
              height: _size!.height * 0.9,
              padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 550,
                    child: Image.network(
                      "https://cdn.shopify.com/s/files/1/0181/2235/products/represent_x_lessons_-_hoodie_2000x.jpg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    child: Text(
                      "REPRESENT X \nLESSONS HOODIE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "\$215.00 GBP\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _size!.height * 0.9,
              padding: EdgeInsets.only(bottom: 50),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 500,
                    child: Image.network(
                      "https://image-tb.airyclub.com/image/500_500/filler/89/b1/f0972fde492ca784e90dd8f63ca289b1.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    child: Text(
                      "DINNER SHIRT X \nSPLIT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "\$215.00 GBP\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _size!.height * 0.9,
              padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 560,
                    child: Image.network(
                      "https://purepng.com/public/uploads/thumbnail/purepng.com-black-t-shirtclothingblack-t-shirtfashion-dress-shirt-black-cloth-tshirt-631522326884f7v4f.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    child: Text(
                      "T-SHIRT X \nWASHSHED BLACK",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "\$100.00 GBP",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _size!.height * 0.9,
              padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 560,
                    child: Image.network(
                      "https://bostontrader.com/media/catalog/product/cache/3e89fe2117019af6de54734bec9c5960/W/-/W-2_158210008_4.JPG",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    child: Text(
                      "LOGO SWEATER X \nRED MARBLE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "\$200.00 GBP",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _gridView() => GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(5),
        childAspectRatio: 0.55,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 250,
                  child: Image.network(
                    "https://cdn.shopify.com/s/files/1/0181/2235/products/represent_x_lessons_-_hoodie_2000x.jpg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  child: Text(
                    "REPRESENT X \nLESSONS HOODIE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "\$215.00 GBP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 250,
                  child: Image.network(
                    "https://image-tb.airyclub.com/image/500_500/filler/89/b1/f0972fde492ca784e90dd8f63ca289b1.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  child: Text(
                    "DINNER SHIRT X \nSPLIT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "\$215.00 GBP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 250,
                  width: 170,
                  child: Image.network(
                    "https://purepng.com/public/uploads/thumbnail/purepng.com-black-t-shirtclothingblack-t-shirtfashion-dress-shirt-black-cloth-tshirt-631522326884f7v4f.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  child: Text(
                    "T-SHIRT X \nWASHSHED BLACK",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "\$100.00 GBP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 250,
                  child: Image.network(
                    "https://bostontrader.com/media/catalog/product/cache/3e89fe2117019af6de54734bec9c5960/W/-/W-2_158210008_4.JPG",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  child: Text(
                    "LOGO SWEATER X \nRED MARBLE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "\$200.00 GBP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  bool ifGrid = true;
}