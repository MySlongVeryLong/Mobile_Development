import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color background;
  const MyCard({
    super.key,
    required this.icon,
    required this.title,
    this.background = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(width: 30),
          Icon(icon, size: 28),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'My Hobbies',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                background: Colors.green,
              ),
              SizedBox(height: 10),
              MyCard(title: 'Skating', icon: Icons.skateboarding),
            ],
          ),
        ),
      ),
    ),
  );
}
