import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/core/models/menu_item.dart';
import 'package:mcdonalds_falseta/src/screens/home/home_widgets/hightlight_tile.dart';
import 'package:mcdonalds_falseta/src/screens/menu_products.dart';

import "package:flutter/services.dart" show rootBundle;

import 'dart:convert';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<MenuItem> hamburguerList = [
    // MenuItem(
    //   image: "assets/hamburguers/c_image_1.png",
    //   price: 35.50,
    //   title: "Cheese Burguer",
    // ),
    // MenuItem(
    //   image: "assets/hamburguers/c_image_2.png",
    //   price: 25,
    //   title: "CheeseBacon Burguer",
    // ),
    // MenuItem(
    //   image: "assets/hamburguers/c_image_3.png",
    //   price: 25,
    //   title: "All Burguer",
    // ),
  ];

  final List<MenuItem> frenchFriesList = [
    MenuItem(
      image: "assets/french_fries/frenchfries1.jpg",
      price: 5,
      title: "French Fries 1",
    ),
    MenuItem(
      image: "assets/french_fries/frenchfries2.jpg",
      price: 6,
      title: "French Fries 1",
    ),
    MenuItem(
      image: "assets/french_fries/frenchfries3.jpg",
      price: 7,
      title: "French Fries 3",
    ),
    MenuItem(
      image: "assets/french_fries/frenchfries4.jpeg",
      price: 8,
      title: "French Fries 4",
    ),
  ];

  final List<MenuItem> sodaList = [
    MenuItem(
      image: "assets/sodas/soda1.jpg",
      price: 1,
      title: "Fanta",
    ),
    MenuItem(
      image: "assets/sodas/soda2.jpg",
      price: 2,
      title: "Zero Coke",
    ),
    MenuItem(
      image: "assets/sodas/soda3.jpg",
      price: 1,
      title: "Coke",
    ),
  ];

  @override
  void initState() {
    super.initState();

    // Mesma coisa do Await/Async
    rootBundle.loadString("assets/json/menuData.json").then((value) {
      // Converter a String para uma lista de Maps
      final convertedToMap = json.decode(value);

      // Converter a Lista de Maps para uma lista de objetos
      hamburguerList = List<MenuItem>.from(
        convertedToMap.map((map) {
          return MenuItem.fromMap(map);
        }).toList(),

      );
      // So Para fazer a tela atualizar
        setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      body: ListView(
        // Para a animação do Scroll
        physics: ClampingScrollPhysics(),
        children: [
          // Imagens de Hamburgueres
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Carousel(
              autoplay: true,
              dotColor: Colors.red,
              dotBgColor: Colors.transparent,
              animationDuration: Duration(seconds: 2),
              images: [
                Image.asset("assets/hamburguers/c_image_1.png",
                    fit: BoxFit.cover),
                Image.asset("assets/hamburguers/c_image_2.png",
                    fit: BoxFit.cover),
                Image.asset("assets/hamburguers/c_image_3.png",
                    fit: BoxFit.cover),
              ],
            ),
          ),

          // Highlights products
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                HightlightTile(),
                HightlightTile(),
                HightlightTile(),
                HightlightTile(),
              ],
            ),
          ),

          // Menu de Produtos
          MenuProducts(
            title: "hamburguers",
            foodList: hamburguerList,
          ),
          MenuProducts(
            title: "French Fries",
            foodList: frenchFriesList,
          ),
          MenuProducts(
            title: "Soda",
            foodList: sodaList,
          ),
        ],
      ),
    );
  }
}
