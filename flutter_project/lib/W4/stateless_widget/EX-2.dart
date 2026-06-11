import 'package:flutter/material.dart';

enum ButtonType {
  primary(color: Colors.blue),
  secondary(color: Colors.green),
  disabled(color: Colors.grey);

  final Color color;

  const ButtonType({required this.color});
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType buttonType;
  final IconPosition position;
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.primary,
    this.position = IconPosition.left,
  });

  Widget onLeftOrRight() {
    List<Widget> rowWidgets = [
      Icon(icon),
      Text(label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    ];
    if (position = IconPosition.left.name) {
      return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowWidgets[0],
          SizedBox(width: 10),
          rowWidgets[1],
        ],
      );
    }
    else {
      return 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowWidgets[1],
          SizedBox(width: 10),
          rowWidgets[0],
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonType.color,
      ),
      
      child: onLeftOrRight(),

      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Icon(icon),
      //     SizedBox(width: 10),
      //     Text(
      //       label,
      //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //     ),
      //   ],
      // ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom buttons', style: TextStyle(fontSize: 24)),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 30),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
              ),
              SizedBox(height: 30),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                buttonType: ButtonType.disabled,
                position: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
