import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      padding: EdgeInsets.all(40.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // first block
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(

              child: Text(
                'OOP',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              )

            )
          ),
          // second block
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(

              child: Text(
                'DART',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              )

            )
          ),
          // third block
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [Colors.blue[300]!, Colors.blue[600]!], 
              ),
            ),
            child: Center(

              child: Text(
                'FLUTTER',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                )
              )
            
            )
          ),



        ],

      )

    )
    )
  );

}
