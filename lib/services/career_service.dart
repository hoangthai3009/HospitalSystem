import 'dart:convert';
import '../config/api_url.dart';
import '../models/career.dart';
import 'package:http/http.dart' as http;

class CareerService {
  static Future<List<Career>> getCareers() async {
    final response = await http.get(ApiUrls().apiCareerList);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> careersData = jsonData as List;
      final List<Career> careers =
          careersData.map((career) => Career.fromJson(career)).toList();
      return careers;
    } else {
      throw Exception('Failed to load career data');
    }
  }
}
