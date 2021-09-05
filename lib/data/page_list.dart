import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/page.dart';
import 'package:portfolio/screens/coffee_bar/coffee_home_page.dart';
import 'package:portfolio/screens/cloth_store/cloth_store_home_page.dart';
import 'package:portfolio/screens/courses.dart';
import 'package:portfolio/screens/menswear_store/menswear_home_page.dart';
import 'package:portfolio/screens/sport_app/sport_home_page.dart';


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

  return pages;
}
