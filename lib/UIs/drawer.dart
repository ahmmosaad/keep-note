import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Drawer_item(),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Drawer_item extends StatefulWidget {
  @override
  _Drawer_itemState createState() => _Drawer_itemState();
}

// ignore: camel_case_types
class _Drawer_itemState extends State<Drawer_item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(5),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.lightbulb),
          SizedBox(
            width: 20,
          ),
          Text('Notes'),
        ],
      ),
    );
  }
}
