import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/core/models/menu_item.dart';
import 'package:mcdonalds_falseta/src/core/models/promo_item.dart';
import 'package:mcdonalds_falseta/src/screens/home/home_widgets/hightlight_tile.dart';
import 'package:mcdonalds_falseta/src/screens/menu_products.dart';

import "package:flutter/services.dart" show rootBundle;

import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<MenuItem> hamburguerList = [];
  List<PromoItem> promoItems = [];
  List<MenuItem> frenchFriesList = [];
  List<MenuItem> sodaList = [];

  Future<void> callingServer() async {
/* -------------------------------------------------------------------------- */
/*                       Requsição de dados de um server                      */
/* -------------------------------------------------------------------------- */

    // * Criar uma rquisição no servidor

    http.Response resposta =
        await http.get("https://jsonplaceholder.typicode.com/users");

    print(resposta.body);

    // * Tratar nossa requisição

    // * Converter os dados retornados para maps

/* -------------------------------------------------------------------------- */
  }

  @override
  void initState() {
    super.initState();

    // -----------------------------
    callingServer();
    // -----------------------------

    // Mesma coisa do Await/Async
    rootBundle.loadString("assets/json/menuData.json").then((value) {
      // Converter a String para uma lista de Maps
      final convertedToMap = json.decode(value);

      // Converter a Lista de Maps para uma lista de objetos
      hamburguerList = retrievingData(convertedToMap["menu"]["hamburguers"]);
      frenchFriesList = retrievingData(convertedToMap["menu"]["fries"]);
      sodaList = retrievingData(convertedToMap["menu"]["sodas"]);
      // So Para fazer a tela atualizar
      setState(() {});
    });

    rootBundle.loadString("assets/json/promoData.json").then((value) {
      final convertedToMap = json.decode(value);
      promoItems = List<PromoItem>.from(
        convertedToMap.map((map) {
          return PromoItem.fromMap(map);
        }).toList(),
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Was Colors.yellow.shade700
      backgroundColor: Colors.grey.shade100,
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

          Text(
            "Promoções do Dia",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),

          // Highlights products
          Container(
            height: 115,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: promoItems.map((e) {
                return HightlightTile(promoItem: e);
              }).toList(),
            ),
          ),

          // Text("Cardápio", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.red)),
          // Menu de Produtos
          MenuProducts(
            title: "French Fries",
            foodList: frenchFriesList,
            color: Colors.orange.shade300,
          ),

          MenuProducts(
            title: "hamburguers",
            foodList: hamburguerList,
            color: Colors.brown,
          ),

          MenuProducts(
            title: "Soda",
            foodList: sodaList,
            color: Colors.orange.shade300,
          ),
        ],
      ),
    );
  }

  List<MenuItem> retrievingData(List convertedToMap) {
    return List<MenuItem>.from(
      convertedToMap.map((map) {
        return MenuItem.fromMap(map);
      }).toList(),
    );
  }
}
