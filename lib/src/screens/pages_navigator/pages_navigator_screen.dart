import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/screens/app_drawer/app_drawer.dart';
import 'package:mcdonalds_falseta/src/screens/clients/clients_tab.dart';
import 'package:mcdonalds_falseta/src/screens/configuration/configuration_tab.dart';
import 'package:mcdonalds_falseta/src/screens/highlights/highlights_tab.dart';
import 'package:mcdonalds_falseta/src/screens/home/home_tab.dart';
import 'package:mcdonalds_falseta/src/screens/orders/orders_tab.dart';

class PagesNavigatorScreen extends StatefulWidget {
  @override
  _PagesNavigatorScreenState createState() => _PagesNavigatorScreenState();
}

class _PagesNavigatorScreenState extends State<PagesNavigatorScreen> {
  int selectedBottomIndex = 1;
  final pageController = PageController(initialPage: 1);
  final scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
          child: Image.asset("assets/hamburger.png"),
        ),
        title: Text("Mcdonalds Falseta"),
        centerTitle: true,
      ),

      drawer: AppDrawer(pageController: pageController,),

      body: PageView(
        controller: pageController,
        //  Parar o scroll do page view
        physics: NeverScrollableScrollPhysics(),
        children: [
          // Screens
          OrdersTab(),
          HomeTab(),
          HighlightsTab(),
          ClientsTab(),
          ConfigurationTab(),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        iconSize: 30,
        selectedItemColor: Colors.white,
        currentIndex: selectedBottomIndex,
        onTap: (index) {
          setState(() {
            selectedBottomIndex = index;
          });
          // Pula pra pagina
          // pageController.jumpToPage(selectedBottomIndex);
          // Pula com animação
          pageController.animateToPage(selectedBottomIndex,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeInCubic);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Hightlights",
          ),
        ],
      ),
    );
  }
}
