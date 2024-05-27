import 'dart:convert';
import 'package:giao_dien_app_benh_vien/config/api_url.dart';
import 'package:giao_dien_app_benh_vien/models/country.dart';
import 'package:http/http.dart' as http;
import '../models/location.dart';
import '../models/provinces.dart';

class LocationService {
  static Future<Location> getLocations(String id) async {
    final response = await http.get(ApiUrls().apiGetLocation(id));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['error'] == 0) {
        final locationData = jsonData['data'];
        return Location.fromJson(locationData);
      } else {
        throw Exception(
            'Failed to load location data: ${jsonData['error_text']}');
      }
    } else {
      throw Exception('Failed to load location data');
    }
  }

  static Future<List<Country>> getCountries() async {
    final response = await http.get(ApiUrls().apiCountriesList);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body) as List;
      final List<Country> countries =
          jsonData.map((country) => Country.fromJson(country)).toList();
      return countries;
    } else {
      throw Exception('Failed to load countries data');
    }
  }

  static Future<List<Province>> getCities() async {
    final response = await http.get(ApiUrls().apiCitiesList);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> citiesData = jsonData['data'];
      final List<Province> cities =
          citiesData.map((city) => Province.fromJson(city)).toList();
      return cities;
    } else {
      throw Exception('Failed to load city data');
    }
  }

  static Future<List<Province>> getDistricts(String id) async {
    final response = await http.get(ApiUrls().apiDistrictsList(id));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> districtsData = jsonData['data'];
      final List<Province> districts =
          districtsData.map((district) => Province.fromJson(district)).toList();
      return districts;
    } else {
      throw Exception('Failed to load district data');
    }
  }

  static Future<List<Province>> getWards(String id) async {
    final response = await http.get(ApiUrls().apiWardsList(id));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> wardsData = jsonData['data'];
      final List<Province> wards =
          wardsData.map((ward) => Province.fromJson(ward)).toList();
      return wards;
    } else {
      throw Exception('Failed to load ward data');
    }
  }
}
