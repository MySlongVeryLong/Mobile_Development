import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'I am tired Boss',
            style: TextStyle(color: Colors.yellow, fontSize: 30.0),
          ),
        ),
      ),
    ),
  );
}
