import 'package:giao_dien_app_benh_vien/models/booking.dart';
import 'package:giao_dien_app_benh_vien/models/history.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_url.dart';

class BookingService {
  Future<void> postBooking({required Booking booking}) async {
    final response = await http.post(
      ApiUrls().apiBooking,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'maHoSo': booking.profileID,
        'cccd': booking.citizenID,
        'hoDem': booking.firstName,
        'ten': booking.lastName,
        'sdt': booking.phoneNumber,
        'ngaySinh': booking.dateOfBirth,
        'email': booking.email,
        'gioiTinh': booking.gender,
        'idPhuong': booking.wardID,
        'duong': booking.address,
        'ngayKham': booking.medicalExaminationDay,
        'idPhong': booking.roomID,
        'idQuocTich': booking.countryID,
        'idDanToc': booking.ethnicityID,
        'idNgheNghiep': booking.careerID,
        'gioKham': booking.medicalExaminationTime,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to post DangKyKham');
    }
  }

  Future<List<History>> getHistoryBooking(String profileID, String phoneNumber) async {
    final response = await http.post(
      ApiUrls().apiBookingList(profileID, phoneNumber),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => History.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch HistoryBooking');
    }
  }
}
