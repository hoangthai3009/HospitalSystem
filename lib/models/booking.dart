class Booking {
  String? profileID;
  String citizenID;
  String firstName;
  String lastName;
  String phoneNumber;
  String dateOfBirth;
  String email;
  bool gender;
  String wardID;
  String address;
  String medicalExaminationDay;
  int roomID;
  int? countryID;
  int? ethnicityID;
  int? careerID;
  String? medicalExaminationTime;

  Booking({
    this.profileID,
    required this.citizenID,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.email,
    required this.gender,
    required this.wardID,
    required this.address,
    required this.medicalExaminationDay,
    required this.roomID,
    required this.countryID,
    required this.ethnicityID,
    required this.careerID,
    required this.medicalExaminationTime,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      profileID: json["maHoSo"],
      citizenID: json["cccd"],
      firstName: json["hoDem"],
      lastName: json["ten"],
      phoneNumber: json["sdt"],
      dateOfBirth: json["ngaySinh"],
      email: json["email"],
      gender: json["gioiTinh"],
      wardID: json["idPhuong"],
      address: json["soNha"],
      medicalExaminationDay: json["ngayKham"],
      roomID: json["idPhong"],
      countryID: json["idQuocTich"],
      ethnicityID: json["IdDanToc"],
      careerID: json["idNgheNghiep"],
      medicalExaminationTime: json["gioKham"],
    );
  }
}
