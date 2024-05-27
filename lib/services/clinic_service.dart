import 'dart:convert';
import '../config/api_url.dart';
import '../models/clinic.dart';
import 'package:http/http.dart' as http;

class ClinicService {
  static Future<List<Clinic>> getClinics() async {
    final response = await http.get(ApiUrls().apiClinicList);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> clinicsData = jsonData as List;
      final List<Clinic> clinics =
          clinicsData.map((clinic) => Clinic.fromJson(clinic)).toList();
      return clinics;
    } else {
      throw Exception('Failed to load clinic data');
    }
  }
}
