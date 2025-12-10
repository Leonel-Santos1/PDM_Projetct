import 'package:flutter/material.dart';
import 'package:pdm_pm/pages/bopm/forms/OcorrenceData.dart';
import 'package:pdm_pm/pages/login/LoginPage.dart';
import 'package:pdm_pm/pages/home/HomePage.dart';
import 'package:pdm_pm/pages/bopm/page/BOPage.dart';

class AppRoutes {
  static const home = "/home";
  static const login = "/login";
  static const bopm = "/bopm";
  static const ocorrence_data = "/ocorrence_data";
  // static const register = "/register";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    bopm: (context) => const BOPage(),
    ocorrence_data: (context) => const OcorrenceData(),
  };
}




