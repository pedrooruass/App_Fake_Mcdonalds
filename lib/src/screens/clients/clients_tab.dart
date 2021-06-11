import 'package:flutter/material.dart';
import 'package:mcdonalds_falseta/src/core/models/user_info.dart';

class ClientsTab extends StatelessWidget {
  final List<UserInfo> usersInfo = [
    UserInfo(
      name: "Pedro Ruas",
      email: "ruasp0509@gmail.com",
      purchaseCount: 5,
    ),
    UserInfo(
      name: "Malu Focassio",
      email: "malu0204@gmail.com",
      purchaseCount: 15,
    ),
    UserInfo(
      name: "Klebao da Silva Sauro",
      email: "klebaoSauro@gmail.com",
      purchaseCount: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.orange,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Users", style: TextStyle(color: Colors.white, fontSize: 35),),
          ),
          // Expanded(child: 2 way to do)
          ListView(
            shrinkWrap: true,
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
        ],
      ),
    );
  }
}
