import 'package:authentication_project/1%20-%20START%20CODE/data/repositories/scores_repository.dart';
import 'package:authentication_project/1%20-%20START%20CODE/data/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../model/score.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key});

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  List<Score>? scores;
  String? error;

  @override
  void initState() {
    super.initState();

    fetchSCores();
  }

  void fetchSCores() async {
    // Ask the ScoresRepository instance to fetch the scores

    try {
      List<Score> scorelist = await ScoresRepository.instance.getSCores();
      // if success, update the scores list and refresh
      setState(() {
        scores = scorelist;
        error = null;
      });
      // If failure, update the error and refresh
    } catch (e) {
      setState(() {
        error = e.toString();
        scores = null;
      });
    }
  }

  String? get userName {
    // Ask the AuthenticationService instance the current user nale (if any)

    final session = AuthenticationService.instance.session;

    return session?.user.name;
  }

  Widget get content {
    // If scores list => dispaly the list using the ScoreTile

    if (scores != null) {
      return ListView.builder(
        itemCount: scores!.length,
        itemBuilder: (context, index) {
          return ScoreTile(score: scores![index]);
        },
      );
      // if error, dispaly the error in red, centered
    } else if (error != null) {
      return Center(
        child: Text(error!, style: TextStyle(color: Colors.red)),
      );
    }
    // otherwise, we disaply the  CircularProgressIndicator
    return CircularProgressIndicator();
  }

  String get welcomeLabel => "Welcome ${userName != null ? userName! : ""} !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(welcomeLabel)),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20.0), child: content),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(title: Text(score.title)),
    );
  }
}
