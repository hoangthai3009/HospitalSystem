import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_url.dart';
import '../models/profile.dart';

class ProfileService {
  Future<Profile> getProfile({required String profileCode}) async {
    final response = await http.post(
      ApiUrls().apiProfileData,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'maHoSo': profileCode,
        'ten': "",
        'sdt': "",
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Profile.fromJson(data);
    } else {
      throw Exception('Failed to post DangKyKham');
    }
  }
}
