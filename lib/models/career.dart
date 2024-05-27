class Career {
  final int id;
  final String name;

  Career({
    required this.id,
    required this.name,
  });

  factory Career.fromJson(Map<String, dynamic> json) {
    return Career(
      id: json["id"],
      name: json["tenNgheNghiep"],
    );
  }
}
