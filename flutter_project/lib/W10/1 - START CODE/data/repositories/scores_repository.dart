import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/auth_session.dart';
import '../../model/score.dart';
import '../services/auth_service.dart';

class ScoresRepository {
  static ScoresRepository instance = ScoresRepository();

  Future<List<Score>> getSCores() async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri scoresUri = baseUri.replace(path: "/scores");

    AuthSession? session = AuthenticationService.instance.session;
    if (session == null) {
      throw Exception("Cannot fetch without authentication");
    }

    // Fetch the GET /scores with the token included in the headers

    final response = await http.get(
      scoresUri,
      headers: {
        "Content-Type": "Application/json",
        "Authorization": "Bearer ${session.token}",
      },
    );

    //  If statusCode 200, decode the json body

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);

      // Convert the json to the lost of scores

      List<Score> scores = [];

      for (var json in jsonData) {
        scores.add(Score.fromJSon(json));
      }

      // If success Return the scores

      return scores;

      // If no success throw exception
    } else {
      throw Exception("Failed to fetch scores: ${response.statusCode}");
    }
  }
}
