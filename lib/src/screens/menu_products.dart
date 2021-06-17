import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/core/models/menu_item.dart';

class MenuProducts extends StatelessWidget {
  

  final String title;
  final List<MenuItem> foodList;
  final Color color;

   MenuProducts({
    this.title,
    this.foodList,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: color,
                child: ExpansionTile(
                  // Mudar pra true
                  initiallyExpanded: false,
                  title: Text(title),
                  children: foodList.map((e) {
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
          );
  }
}
