import 'package:flutter/material.dart';

class ChangeState extends StatefulWidget {
  const ChangeState({super.key});

  @override
  State<ChangeState> createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  bool isSelected = false;
  String get textLabel => isSelected ? 'selected' : 'Not selected';
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
          ),
          onPressed: () => {
            setState(() {
              isSelected = !isSelected;
            })
          },
          child: Center(
            child: Text(textLabel),
          ) 
          
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ChangeState(),
          ChangeState(),
          ChangeState(),
          ChangeState(),
        ],
      )
    ),
  ),
);
