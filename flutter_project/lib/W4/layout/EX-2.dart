import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final Color background;
  final String label;

  const BuildButton({super.key, required this.background, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class GradiantButton extends StatelessWidget {
  final String label;
  final Color start;
  final Color end;

  const GradiantButton({
    super.key,
    required this.label,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [start, end]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradiantButton(
                label: 'Hello 1',
                start: Colors.green[100]!,
                end: Colors.green[600]!,
              ),
                GradiantButton(
                label: 'Hello 2',
                start: Colors.pink[100]!,
                end: Colors.purple[600]!,
              ),
                GradiantButton(
                label: 'Hello 3',
                start: Colors.orange[100]!,
                end: Colors.yellow[600]!,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
