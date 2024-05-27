import 'dart:convert';
import '../config/api_url.dart';
import '../models/ethnicity.dart';
import 'package:http/http.dart' as http;

class EthnicityService {
  static Future<List<Ethnicity>> getEthnicities() async {
    final response = await http.get(ApiUrls().apiEthnicityList);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> ethnicitysData = jsonData as List;
      final List<Ethnicity> ethnicitys = ethnicitysData
          .map((ethnicity) => Ethnicity.fromJson(ethnicity))
          .toList();
      return ethnicitys;
    } else {
      throw Exception('Failed to load ethnicity data');
    }
  }
}
