import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        
        margin: EdgeInsets.all(50.0),   
        padding: EdgeInsets.all(40.0),  
        color: Colors.blue[300],              
        
     
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[600],          
            borderRadius: BorderRadius.circular(20.0), 
          ),
          
          
          child: Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,          
                fontSize: 24.0,                
              ),
            ),
          ),
        ),
      ),
    ),
  );
}