import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ButtonStatus {
  final String title;
  final bool selected;

  ButtonStatus({required this.title,required this.selected});

  static ButtonStatus fromJson(Map<String, dynamic> json) {
    return ButtonStatus(title: json["title"], selected: json["selected"]);
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final String baseUrl =
      "https://jeff-68fed-default-rtdb.asia-southeast1.firebasedatabase.app/.json";

  ButtonStatus? buttonStatus;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchButtonData();
  }

  // request data to the database
  void _fetchButtonData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);

        setState(() {
          buttonStatus = ButtonStatus.fromJson(decodedJson);
          errorMessage = null;
        });
      } else {
        throw Exception("Failed to load data from server");
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  // update the status

  void onTap() async {
    if (buttonStatus == null){
      return;
    } 

    bool newStatus = !buttonStatus!.selected;

    try {
      final response = await http.patch(Uri.parse(baseUrl),
        body: jsonEncode({"selected": newStatus}),
      );

      if (response.statusCode == 200) {
        setState(() {
          buttonStatus = ButtonStatus(
            title: buttonStatus!.title,
            selected: newStatus,
          );
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Widget get bodyLayout {
    if (errorMessage != null) {
      return Text(
        "Error: $errorMessage",
        style: const TextStyle(color: Colors.red),
      );
    }

    if (buttonStatus != null) {
      return AppButton(
        titleText: buttonStatus!.title,
        isCompleted: buttonStatus!.selected,
        onButtonPress: onTap,
      );
    }

    return const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 1"), centerTitle: true),
      body: Center(child: bodyLayout),
    );
  }
}

class AppButton extends StatelessWidget {
  final String titleText;
  final bool isCompleted;
  final VoidCallback onButtonPress;

  const AppButton({
    super.key,
    required this.titleText,
    required this.isCompleted,
    required this.onButtonPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPress,
      child: Container(
        decoration: BoxDecoration(
          color: isCompleted ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Text(
          titleText.toUpperCase(),
          style: TextStyle(
            color: isCompleted ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
