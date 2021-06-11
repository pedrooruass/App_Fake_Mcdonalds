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
  
}