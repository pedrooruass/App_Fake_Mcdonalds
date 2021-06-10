import 'package:flutter/material.dart';

class HightlightTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(left: 10),

      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Food",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("10.50"),
                  Icon(Icons.arrow_forward),
                  Text("10.50"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
