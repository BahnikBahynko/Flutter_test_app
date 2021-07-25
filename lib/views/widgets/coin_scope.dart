import 'package:flutter/material.dart';

class CoinScope extends StatelessWidget {
  final String price;
  final String timestamp;
  CoinScope({
    @required required this.price,
    @required required this.timestamp
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      width: (MediaQuery.of(context).size.width * 0.65),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              1.5,
            ),
            blurRadius: 1.0,
            spreadRadius: -1.0,
          ),
        ],
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
          children: [
            Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Row(children: [
                Icon(
                  Icons.attach_money,
                  color: Colors.grey,
                  size: 18,
                  ),
                  SizedBox(width: 7),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
              ),
              ],)
            ),
            alignment: Alignment.centerLeft,
          ),
          ]
        )),
        Container(
          child: Column(
          children: [
            Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Row(children: [
                Icon(
                  Icons.date_range,
                  color: Colors.grey,
                  size: 18,
                  ),
                  SizedBox(width: 7),
                Text(
                  timestamp,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
              ),
              ],)
            ),
            alignment: Alignment.centerLeft,
          ),
          ]
        )),
      ]
    ));
  }
}
