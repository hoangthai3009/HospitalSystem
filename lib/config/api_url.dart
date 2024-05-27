import 'constants.dart';

class ApiUrls {
  final Uri apiClinicList = Uri.parse('${baseUrl}api/Phongkham');

  final Uri apiCareerList = Uri.parse('${baseUrl}api/NgheNghiep');

  final Uri apiEthnicityList = Uri.parse('${baseUrl}api/DanToc');

  final Uri apiBooking = Uri.parse('${baseUrl}api/DangKyKham');

  final Uri apiCountriesList = Uri.parse('${baseUrl}api/QuocTich');

  final Uri apiProfileData = Uri.parse('${baseUrl}api/HoSo');

  Uri apiGetLocation(String id) =>
      Uri.parse('https://esgoo.net/api-tinhthanh/5/$id.htm');

  //final Uri apiCountriesList = Uri.parse('https://restcountries.com/v3.1/independent?status=true&fields=name');

  final Uri apiCitiesList =
      Uri.parse('https://esgoo.net/api-tinhthanh/1/0.htm');

  Uri apiDistrictsList(String id) =>
      Uri.parse('https://esgoo.net/api-tinhthanh/2/$id.htm');

  Uri apiWardsList(String id) =>
      Uri.parse('https://esgoo.net/api-tinhthanh/3/$id.htm');

  Uri apiRegistration = Uri.parse('${baseUrl}api/DangKyKham');
}
