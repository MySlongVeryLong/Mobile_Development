import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(height: 100.0, color: Colors.white),
            Container(height: 400.0, color: Colors.lightBlueAccent),
            Row(
              children: [
                Expanded(child: Container(height: 100, color: Colors.green)),
                Container(height: 100, width: 100, color: Colors.pink),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(height: 100, color: Colors.blueAccent),
                ),
                const SizedBox(width: 20.0),

                Expanded(
                  child: Container(height: 100, color: Colors.blueAccent),
                ),
                const SizedBox(width: 20.0),

                Expanded(
                  child: Container(height: 100, color: Colors.blueAccent),
                ),
              ],
            ),
            const SizedBox(height: 20.0,),
            Expanded(
              child: Container(width: double.infinity, color: Colors.pink),
            ),
          ],
        ),
      ),
    ),
  );
}
