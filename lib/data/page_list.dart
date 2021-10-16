import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/page.dart';
import 'package:portfolio/screens/audio_dictionary/audio_dictionary.dart';
import 'package:portfolio/screens/booking/booking_splash_screen.dart';
import 'package:portfolio/screens/car_shop/car_shop_home_page.dart';
import 'package:portfolio/screens/chat_ui/chat_home_page.dart';
import 'package:portfolio/screens/click_game/click_game.dart';
import 'package:portfolio/screens/coffee_page_view/coffee_home_page.dart';
import 'package:portfolio/screens/coffee_bar/coffee_home_page.dart';
import 'package:portfolio/screens/cloth_store/cloth_store_home_page.dart';
import 'package:portfolio/screens/countries/countries_ui.dart';
import 'package:portfolio/screens/courses/courses.dart';
import 'package:portfolio/screens/delivery/delivery_home_page.dart';
import 'package:portfolio/screens/furniture_shop/furnish_shop_home_page.dart';
import 'package:portfolio/screens/login/login_home_page.dart';
import 'package:portfolio/screens/menswear_store/menswear_home_page.dart';
import 'package:portfolio/screens/music_app/music_app_homepage.dart';
import 'package:portfolio/screens/namoz_vaqtlari/namoz_vaqtlari.dart';
import 'package:portfolio/screens/rent_car/rent_car_home_page.dart';
import 'package:portfolio/screens/son_top_oyini/son_top_oyini.dart';
import 'package:portfolio/screens/sport_app/sport_home_page.dart';
import 'package:portfolio/screens/water_shop/water_shop_home_page.dart';
import 'package:portfolio/screens/yacht/yacht_home_page.dart';


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

  pages.add(new PageUI(
      "Yacht",
      "Charters",
      Icon(
        Icons.anchor,
        color: Colors.white,
        size: 40.0,
      ),
      YachtHomePage()));

  pages.add(new PageUI(
      "Click",
      "game",
      Icon(
        Icons.videogame_asset,
        color: Colors.white,
        size: 40.0,
      ),
      ClickGame()));

  pages.add(new PageUI(
      "Namoz vaqtlari",
      "",
      Icon(
        CupertinoIcons.moon_fill,
        color: Colors.white,
        size: 40.0,
      ),
      NamozVaqtlariUi()));

  pages.add(new PageUI(
      "MusicList",
      "Your music player",
      Icon(
        CupertinoIcons.moon_fill,
        color: Colors.white,
        size: 40.0,
      ),
      MusicApp()));

  // pages.add(new PageUI(
  //     "Word to audio",
  //     "",
  //     Icon(
  //       Icons.audiotrack,
  //       color: Colors.white,
  //       size: 40.0,
  //     ),
  //     AudioDictionary()));

  pages.add(new PageUI(
      "VOLKSWAGEN",
      "Car shop",
      Icon(
        CupertinoIcons.moon_fill,
        color: Colors.white,
        size: 40.0,
      ),
      CarShop()));

  pages.add(new PageUI(
      "Countries",
      "",
      Icon(
        Icons.map,
        color: Colors.white,
        size: 40.0,
      ),
      CountriesHomePage()));




  return pages;
}
