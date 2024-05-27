class Profile {
  String cccd;
  String hoDem;
  String ten;
  String sdt;
  String ngaySinh;
  String email;
  bool gioiTinh;
  String idPhuong;
  String tenPhuong;
  String idHuyen;
  String tenHuyen;
  String idTinh;
  String tenTinh;
  String duong;
  int? idDanToc;
  String? tenDanToc;
  int? idQuocTich;
  String? tenQuocTich;
  int? idNgheNghiep;
  String? tenNgheNghiep;

  Profile({
    required this.cccd,
    required this.hoDem,
    required this.ten,
    required this.sdt,
    required this.ngaySinh,
    required this.email,
    required this.gioiTinh,
    required this.idPhuong,
    required this.tenPhuong,
    required this.idHuyen,
    required this.tenHuyen,
    required this.idTinh,
    required this.tenTinh,
    required this.duong,
    this.idDanToc,
    this.tenDanToc,
    this.idQuocTich,
    this.tenQuocTich,
    this.idNgheNghiep,
    this.tenNgheNghiep,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      cccd: json['cccd'],
      hoDem: json['hoDem'],
      ten: json['ten'],
      sdt: json['sdt'],
      ngaySinh: json['ngaySinh'],
      email: json['email'],
      gioiTinh: json['gioiTinh'],
      idPhuong: json['idPhuong'],
      tenPhuong: json['tenPhuong'],
      idHuyen: json['idHuyen'],
      tenHuyen: json['tenHuyen'],
      idTinh: json['idTinh'],
      tenTinh: json['tenTinh'],
      duong: json['duong'],
      idDanToc: json['idDanToc'],
      tenDanToc: json['tenDanToc'],
      idQuocTich: json['idQuocTich'],
      tenQuocTich: json['tenQuocTich'],
      idNgheNghiep: json['idNgheNghiep'],
      tenNgheNghiep: json['tenNgheNghiep'],
    );
  }
}
