import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pick_finish_predictor_ui/models/prediction_models.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api/v1/predict';

  Future<CompletionResultModel> fetchPrediction(MetricsModel metrics) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(metrics.toJson()),
    );

    if(response.statusCode == 200){
      return CompletionResultModel.fromJson(jsonDecode(response.body));
    } else{
      throw Exception('Failed to connect to Spring Boot server: ${response.statusCode}');
    }
  }
}