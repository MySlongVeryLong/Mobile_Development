import 'package:flutter/material.dart';

enum ButtonType {
  primary(color: Colors.blue),
  secondary(color: Colors.green),
  disabled(color: Colors.grey);

  final Color color;

  const ButtonType({required this.color});
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType buttonType;
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonType.color,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            label,
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
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
