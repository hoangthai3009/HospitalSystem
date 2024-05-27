class Location {
  final String cityId;
  final String districtId;
  final String wardId;

  Location({
    required this.cityId,
    required this.districtId,
    required this.wardId,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      cityId: json['tinh'],
      districtId: json['quan'],
      wardId: json['phuong'],
    );
  }
}
