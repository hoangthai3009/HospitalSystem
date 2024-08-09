import 'dart:async';
import 'package:flutter/material.dart';
import 'package:giao_dien_app_benh_vien/components/name_utils.dart';
import 'package:giao_dien_app_benh_vien/pages/success_page.dart';
import 'package:intl/intl.dart';

import '../components/show_message.dart';
import '../models/career.dart';
import '../models/ethnicity.dart';
import '../models/profile.dart';
import '../models/booking.dart';
import '../models/clinic.dart';
import '../models/country.dart';
import '../models/provinces.dart';
import '../services/career_service.dart';
import '../services/ethnicity_service.dart';
import '../services/profile_service.dart';
import '../services/clinic_service.dart';
import '../services/location_service.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/dropdown.dart';
import '../widgets/text_field.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late TextEditingController _profileIdController, _citizenIDController, _phoneNumberController, _fullNameController, _dobController, _emailController, _addressController, _appointmentDateController;

  final List<String> _genders = ["Nam", "Nữ"];
  bool _isMale = true;

  final List<String> _appointmentTimes = ['7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00'];
  String _selectedAppointmentTime = '10:00';

  bool _showAdditionalFields = false;

  List<Province>? _cities;
  Province? _selectedCity;

  List<Province>? _districts;
  Province? _selectedDistrict;

  List<Province>? _wards;
  Province? _selectedWard;
  late String _selectedWardId;

  List<Clinic>? _clinics;
  Clinic? _selectedClinic;
  int? _selectedClinicId;

  List<Country>? _countries;
  Country? _selectedCountry;
  int? _selectedCountryId;

  List<Ethnicity>? _ethnicities;
  Ethnicity? _selectedEthnicity;
  int? _selectedEthnicityId;

  List<Career>? _careers;
  Career? _selectedCareer;
  int? _selectedCareerId;

  final ProfileService _profileService = ProfileService();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _loadInitialData();
  }

  void _initializeControllers() {
    _profileIdController = TextEditingController();
    _citizenIDController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _fullNameController = TextEditingController();
    _dobController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _appointmentDateController = TextEditingController(text: DateFormat('dd/MM/yyyy').format(DateTime.now()));
    _selectedWardId = '';
  }

  Future<void> _loadInitialData() async {
    await Future.wait([
      _loadClinics(),
      _loadCities(),
      _loadCountries(),
      _loadCareers(),
      _loadEthnicities(),
    ]);
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _profileIdController.dispose();
    _citizenIDController.dispose();
    _phoneNumberController.dispose();
    _fullNameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _appointmentDateController.dispose();
  }

  Future<void> _fillData() async {
    try {
      // Clear current data
      _citizenIDController.clear();
      _phoneNumberController.clear();
      _fullNameController.clear();
      _dobController.clear();
      _emailController.clear();
      _addressController.clear();
      _cities = null;
      _districts = null;
      _wards = null;
      _selectedCity = null;
      _selectedDistrict = null;
      _selectedWard = null;
      _selectedWardId = '';
      _isMale = true;
      _selectedCountry = null;
      _selectedCountryId = null;
      _selectedEthnicity = null;
      _selectedEthnicityId = null;
      _selectedCareer = null;
      _selectedCareerId = null;

      // Fill data from profile
      Profile bookingData = await _profileService.getProfile(profileCode: _profileIdController.text);
      setState(() {
        _citizenIDController.text = bookingData.cccd;
        _phoneNumberController.text = bookingData.sdt;
        _fullNameController.text = "${bookingData.hoDem} ${bookingData.ten}";
        _dobController.text = DateFormat('dd/MM/yyyy').format(DateTime.parse(bookingData.ngaySinh));
        _emailController.text = bookingData.email;
        _loadCities();
        _loadDistricts(bookingData.idTinh);
        _loadWards(bookingData.idHuyen);
        _selectedCity = Province(id: bookingData.idTinh, name: bookingData.tenTinh);
        _selectedDistrict = Province(id: bookingData.idHuyen, name: bookingData.tenHuyen);
        _selectedWard = Province(id: bookingData.idPhuong, name: bookingData.tenPhuong);
        _selectedWardId = bookingData.idPhuong;
        _addressController.text = bookingData.duong;
        _isMale = bookingData.gioiTinh;
        _selectedCountry = bookingData.idQuocTich != null ? Country(id: bookingData.idQuocTich!, name: bookingData.tenQuocTich!) : null;
        _selectedCountryId = bookingData.idQuocTich;
        _selectedEthnicity = bookingData.idDanToc != null ? Ethnicity(id: bookingData.idDanToc!, name: bookingData.tenDanToc!) : null;
        _selectedEthnicityId = bookingData.idDanToc;
        _selectedCareer = bookingData.idNgheNghiep != null ? Career(id: bookingData.idNgheNghiep!, name: bookingData.tenNgheNghiep!) : null;
        _selectedCareerId = bookingData.idNgheNghiep;
      });
    } catch (e) {
      throw Exception('Error filling data: $e');
    }
  }

  Widget _buildAdditionalFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myDropdown(
          context,
          _countries?.map((e) => e.name).toList(),
          _selectedCountry?.name,
          (String? value) {
            setState(() {
              _selectedCountry = _countries?.firstWhere((element) => element.name == value);
              _selectedCountryId = _selectedCountry?.id ?? 0;
            });
          },
          'Quốc tịch',
        ),
        myDropdown(
          context,
          _ethnicities?.map((e) => e.name).toList(),
          _selectedEthnicity?.name,
          (String? value) {
            setState(() {
              _selectedEthnicity = _ethnicities?.firstWhere((element) => element.name == value);
              _selectedEthnicityId = _selectedEthnicity?.id ?? 0;
            });
          },
          'Dân tộc',
        ),
        myDropdown(
          context,
          _careers?.map((e) => e.name).toList(),
          _selectedCareer?.name,
          (String? value) {
            setState(() {
              _selectedCareer = _careers?.firstWhere((element) => element.name == value);
              _selectedCareerId = _selectedCareer?.id ?? 0;
            });
          },
          'Nghề Nghiệp',
        ),
        myDropdown(
          context,
          _appointmentTimes,
          _selectedAppointmentTime,
          (String? value) => setState(() => _selectedAppointmentTime = value!),
          'Giờ Khám',
        ),
      ],
    );
  }

  Future<void> _loadClinics() async {
    try {
      final clinics = await ClinicService.getClinics();
      setState(() {
        _clinics = clinics;
      });
    } catch (e) {
      throw Exception('Error loading clinics: $e');
    }
  }

  Future<void> _loadCities() async {
    try {
      final cities = await LocationService.getCities();
      setState(() {
        _cities = cities;
      });
    } catch (e) {
      throw Exception('Error loading cities: $e');
    }
  }

  Future<void> _loadDistricts(String id) async {
    try {
      final districts = await LocationService.getDistricts(id);
      setState(() {
        _districts = districts;
      });
    } catch (e) {
      throw Exception('Error loading districts: $e');
    }
  }

  Future<void> _loadWards(String id) async {
    try {
      final wards = await LocationService.getWards(id);
      setState(() {
        _wards = wards;
      });
    } catch (e) {
      throw Exception('Error loading wards: $e');
    }
  }

  Future<void> _loadCountries() async {
    try {
      final countries = await LocationService.getCountries();
      setState(() {
        _countries = countries;
      });
    } catch (e) {
      throw Exception('Error loading countries: $e');
    }
  }

  Future<void> _loadCareers() async {
    try {
      final careers = await CareerService.getCareers();
      setState(() {
        _careers = careers;
      });
    } catch (e) {
      throw Exception('Error loading careers: $e');
    }
  }

  Future<void> _loadEthnicities() async {
    try {
      final ethnicities = await EthnicityService.getEthnicities();
      setState(() {
        _ethnicities = ethnicities;
      });
    } catch (e) {
      throw Exception('Error loading ethnicities: $e');
    }
  }

  bool _checkValid() {
    return _citizenIDController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _fullNameController.text.isNotEmpty && _dobController.text.isNotEmpty && _emailController.text.isNotEmpty && _selectedWardId.isNotEmpty && _addressController.text.isNotEmpty && _selectedClinicId != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Đăng Ký Khám'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(Icons.qr_code),
                  SizedBox(width: 8),
                  Text(
                    'Quét thẻ BHYT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            myTextField(_profileIdController, 'Mã Hồ Sơ (nếu có)', length: 12, haveIcon: true, onIconPressed: _fillData),
            myTextField(_citizenIDController, 'CCCD (*)', length: 12, inputType: InputType.number),
            myTextField(_phoneNumberController, 'Điện thoại (*)', length: 10, inputType: InputType.number),
            myTextField(_fullNameController, 'Họ Tên (*)'),
            myDatePickerField(_dobController, 'Ngày sinh (*)', context),
            myTextField(_emailController, 'Email (*)', inputType: InputType.email),
            myDropdown(
              context,
              _cities?.map((e) => e.name).toList(),
              _selectedCity?.name,
              (String? value) {
                setState(() {
                  _selectedCity = _cities?.firstWhere((element) => element.name == value);
                  _districts = null;
                  _selectedDistrict = null;
                  _wards = null;
                  _selectedWard = null;
                  _selectedWardId = '';
                });
                _loadDistricts(_selectedCity!.id);
              },
              'Tỉnh/TP (*)',
            ),
            myDropdown(
              context,
              _districts?.map((e) => e.name).toList(),
              _selectedDistrict?.name,
              (String? value) {
                setState(() {
                  _selectedDistrict = _districts?.firstWhere((element) => element.name == value);
                  _wards = null;
                  _selectedWard = null;
                  _selectedWardId = '';
                });
                _loadWards(_selectedDistrict!.id);
              },
              'Quận/Huyện (*)',
            ),
            myDropdown(
              context,
              _wards?.map((e) => e.name).toList(),
              _selectedWard?.name,
              (String? value) {
                setState(() {
                  _selectedWard = _wards?.firstWhere((element) => element.name == value);
                  _selectedWardId = _selectedWard?.id ?? '';
                });
              },
              'Phường/Xã (*)',
            ),
            myTextField(_addressController, 'Số nhà/Đường (*)'),
            myDropdown(
              context,
              _genders,
              _isMale ? 'Nam' : 'Nữ',
              (String? value) {
                setState(() {
                  _isMale = value == 'Nam';
                });
              },
              'Giới tính',
            ),
            myDatePickerField(_appointmentDateController, 'Ngày Khám (*)', context),
            myDropdown(
              context,
              _clinics?.map((e) => e.name).toList(),
              _selectedClinic?.name,
              (String? value) {
                setState(() {
                  _selectedClinic = _clinics?.firstWhere((element) => element.name == value);
                  _selectedClinicId = _selectedClinic?.id ?? 0;
                });
              },
              'Phòng Khám(*)',
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _showAdditionalFields = !_showAdditionalFields;
                });
              },
              child: Text(_showAdditionalFields ? 'Ẩn thông tin' : 'Thêm thông tin'),
            ),
            const SizedBox(height: 16.0),
            if (_showAdditionalFields) _buildAdditionalFields(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!_checkValid()) {
                      showMessage(context, "Vui lòng điền đầy đủ thông tin.");
                      return;
                    }
                    String dateOfBirth = DateFormat('yyyy-MM-dd').format(DateFormat('dd/MM/yyyy').parse(_dobController.text));
                    String dayOfTheExamination = DateFormat('yyyy-MM-dd').format(DateFormat('dd/MM/yyyy').parse(_appointmentDateController.text));
                    String firstName = NameUtils.getMiddleName(_fullNameController.text);
                    String lastName = NameUtils.getLastName(_fullNameController.text);

                    Booking bookingData = Booking(
                      profileID: _profileIdController.text,
                      citizenID: _citizenIDController.text,
                      firstName: firstName,
                      lastName: lastName,
                      phoneNumber: _phoneNumberController.text,
                      dateOfBirth: dateOfBirth,
                      email: _emailController.text,
                      gender: _isMale,
                      wardID: _selectedWardId,
                      address: _addressController.text,
                      medicalExaminationDay: dayOfTheExamination,
                      roomID: _selectedClinicId!,
                      countryID: _selectedCountryId,
                      ethnicityID: _selectedEthnicityId,
                      careerID: _selectedCareerId,
                      medicalExaminationTime: _selectedAppointmentTime,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessPage(bookingData: bookingData),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                  ),
                  child: const Text(
                    'Hoàn thành',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/booking');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                  child: const Text(
                    'Làm mới',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
