import 'package:flutter/material.dart';
import 'package:pdm_pm/LoginPage.dart';
import 'package:pdm_pm/pages/HomePage.dart';
import 'package:pdm_pm/pages/BopmPage.dart';

class AppRoutes {
  static const home = "/home";
  static const login = "/login";
  static const bopm = "/bopm";
  // static const register = "/register";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    bopm: (context) => const  BopmPage()
  };
}




