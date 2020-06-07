import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelUi/widgets/HotelEx.dart';
import "package:travelUi/widgets/TopDestination.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIcon = 0;
  int currentIndex = 0;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.hiking
  ];

  Widget buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: selectedIcon == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          icons[index],
          color: selectedIcon == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
          size: 25.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 45.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 70.0, left: 20.0),
            child: Text(
              "What would you like to find?",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: icons
                .asMap()
                .entries
                .map((MapEntry map) => buildIcon(map.key))
                .toList(),
          ),
          SizedBox(
            height: 30.0,
          ),
          TopDestination(),
          HotelEx()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza), title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage:
                    NetworkImage("https://d.top4top.io/p_16186qkmh1.png"),
              ),
              title: SizedBox.shrink())
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
