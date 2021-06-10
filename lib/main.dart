import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/screens/pages_navigator/pages_navigator_screen.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mcdonalds Falseta",
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: PagesNavigatorScreen(),
    );
  }
}
