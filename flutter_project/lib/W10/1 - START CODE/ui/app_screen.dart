import 'package:authentication_project/1%20-%20START%20CODE/data/services/auth_service.dart';
import 'package:authentication_project/1%20-%20START%20CODE/ui/scores_screen.dart';
import 'package:flutter/material.dart';
import 'auth_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  void onLogin() {
    setState(() {});
  }

  Widget get content {
    // if logged in -> Display ScoresScreen
    if (AuthenticationService.instance.isLoggedIn) {
      return ScoresScreen();
    }
    // otherwise -> DisplayAuthScreen
    return AuthScreen(onLogin: onLogin);
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
