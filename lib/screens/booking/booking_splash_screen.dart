import 'package:flutter/material.dart';
import 'package:portfolio/screens/booking/booking_home_page.dart';

class BookingSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xfffd4835),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BookingHomePage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.hotel_outlined,
                  color: Colors.white,
                  size: 45,
                ),
                Text(
                  "OTEL",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 40.0),
                ),
              ],
            ),
          )),
    );
  }
}
