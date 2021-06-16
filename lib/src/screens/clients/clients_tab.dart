import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/core/models/user_info.dart';
import "package:flutter/services.dart" show rootBundle;

class ClientsTab extends StatefulWidget {
  @override
  _ClientsTabState createState() => _ClientsTabState();
}

class _ClientsTabState extends State<ClientsTab> {
  List<UserInfo> usersInfo = [];

  @override
  void initState() {
    super.initState();

    rootBundle.loadString("assets/json/usersData.json").then((value) {
      final convertedToMap = json.decode(value);
      print(convertedToMap);

      usersInfo = List<UserInfo>.from(
        convertedToMap.map((map) {
          return UserInfo.fromMap(map);
        }),
      );

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.orange,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Users",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),

          Expanded(
            child: ListView(
              children: usersInfo.map(
                (user) {
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Text("${user.purchaseCount} pur."),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
