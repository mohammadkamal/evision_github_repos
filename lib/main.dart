import 'package:evision_github_repos/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GithubRepos());
}

class GithubRepos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Repos',
      theme: defaultThemeData,
      home: HomePage(),
    );
  }
}

//////////////////////////////////////////////////
/// Theme Data

AppBarTheme appBarTheme = AppBarTheme(
    elevation: 0,
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black));

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red[400])));

ThemeData defaultThemeData = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData);
