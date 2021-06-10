import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/core/models/menu_item.dart';
import 'package:mcdonalds_falseta/src/screens/home/home_widgets/hightlight_tile.dart';

class HomeTab extends StatelessWidget {
  List<MenuItem> contentList = [
    MenuItem(
      image: "assets/c_image_1.png",
      price: 35.50,
      title: "Cheese Burguer",
    ),
    MenuItem(
      image: "assets/c_image_2.png",
      price: 25,
      title: "CheeseBacon Burguer",
    ),
    MenuItem(
      image: "assets/c_image_3.png",
      price: 15,
      title: "Normal Burguer",
    ),
  ];

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
                Image.asset("assets/c_image_1.png", fit: BoxFit.cover),
                Image.asset("assets/c_image_2.png", fit: BoxFit.cover),
                Image.asset("assets/c_image_3.png", fit: BoxFit.cover),
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
          Padding(
            padding: EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.white,
                child: ExpansionTile(
                  title: Text("Hamburguers"),
                  children: contentList.map((e) {
                    return ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(e.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(e.title),
                      trailing: Text("R\$ ${e.price.toStringAsFixed(2).replaceAll(".", ",")}"),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
