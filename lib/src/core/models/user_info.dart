import 'package:flutter/material.dart';

class UserInfo {
  String name;
  String email; 
  int purchaseCount;

  UserInfo({
    @required this.name,
    @required this.email,
    @required this.purchaseCount,
  });
  

  factory UserInfo.fromMap(Map<String, dynamic> map){
    return UserInfo(
      name: map["name"],
      email: map["email"],
      purchaseCount: map["purchaseCount"],
    );
  }

  @override
  String toString() => 'UserInfo(name: $name | email: $email, | purchaseCount: $purchaseCount)';
}
