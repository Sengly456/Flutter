import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("My Hobbies"),
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              HobbyCard(icon: Icons.travel_explore, hobby: "Travelling"),
              HobbyCard(icon: Icons.skateboarding, hobby: "Skating"),
            ],
          ),
        ),
      ),
    ));

class HobbyCard extends StatelessWidget {
  const HobbyCard({required this.icon, required this.hobby, super.key});
  final String hobby;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.only(bottom: 10, left: 40, right: 40),
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            Text(
              hobby,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ]),
        ),
      ),
    );
  }
}
