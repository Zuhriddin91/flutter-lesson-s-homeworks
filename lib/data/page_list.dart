import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/page.dart';
import 'package:portfolio/screens/booking/booking_splash_screen.dart';
import 'package:portfolio/screens/chat_ui/chat_home_page.dart';
import 'package:portfolio/screens/cofee_page_view/cofee_home_page.dart';
import 'package:portfolio/screens/coffee_bar/coffee_home_page.dart';
import 'package:portfolio/screens/cloth_store/cloth_store_home_page.dart';
import 'package:portfolio/screens/courses/courses.dart';
import 'package:portfolio/screens/delivery/delivery_home_page.dart';
import 'package:portfolio/screens/furniture_shop/furnish_shop_home_page.dart';
import 'package:portfolio/screens/login/login_home_page.dart';
import 'package:portfolio/screens/menswear_store/menswear_home_page.dart';
import 'package:portfolio/screens/rent_car/rent_car_home_page.dart';
import 'package:portfolio/screens/son_top_oyini/son_top_oyini.dart';
import 'package:portfolio/screens/sport_app/sport_home_page.dart';
import 'package:portfolio/screens/water_shop/water_shop_home_page.dart';


List<PageUI> pageList() {
  List<PageUI> pages = [];


  pages.add(new PageUI(
      "Coffee shop",
      "Coffee shop UI",
      Icon(
        Icons.album_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      CoffeShopHomePage()));

  pages.add(new PageUI(
      "Cloth Store",
      "Cloth Store UI",
      Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      ClothStoreHomePAge()));

  pages.add(new PageUI(
      "Sport App",
      "Sport App UI",
      Icon(
        Icons.run_circle_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      SportHomePage()));

  pages.add(new PageUI(
      "Courses",
      "Courses UI",
      Icon(
        Icons.account_balance_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      Courses()));

  pages.add(new PageUI(
      "Mens Wear Store",
      "Mens Wear Store UI",
      Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      MensWearHome()));

  pages.add(new PageUI(
      "Course Login",
      "Course Login UI",
      Icon(
        Icons.login,
        color: Colors.white,
        size: 40.0,
      ),
      LoginHomePage()));

  pages.add(new PageUI(
      "Rent Car",
      "Service for rent car",
      Icon(
        CupertinoIcons.car_detailed,
        color: Colors.white,
        size: 40.0,
      ),
      RentCarHomePage()));

  pages.add(new PageUI(
      "Delivery",
      "Food delivery",
      Icon(
        Icons.delivery_dining,
        color: Colors.white,
        size: 40.0,
      ),
      DeliveryHomePage()));

  pages.add(new PageUI(
      "Son Top",
      "Son Topish O'yini",
      Icon(
        Icons.gamepad_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      SonTop()));

  pages.add(new PageUI(
      "Water Shop",
      "Buy water online",
      Icon(
        Icons.wine_bar_rounded,
        color: Colors.white,
        size: 40.0,
      ),
      WaterShopHomePage()));
  pages.add(new PageUI(
      "Chat UI",
      "telegram analog",
      Icon(
        Icons.chat,
        color: Colors.white,
        size: 40.0,
      ),
      ChatHomePage()));
  pages.add(new PageUI(
      "Booking",
      "book a hotel online",
      Icon(
        Icons.hotel_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      BookingSplashScreen()));

  pages.add(new PageUI(
      "Cofee",
      "page view",
      Icon(
        Icons.album_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      CofeePageView()));

  pages.add(new PageUI(
      "Furniture",
      "online shop",
      Icon(
        Icons.weekend_outlined,
        color: Colors.white,
        size: 40.0,
      ),
      FurnishHomePage()));




  return pages;
}
