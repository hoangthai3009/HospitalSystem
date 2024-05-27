class Ethnicity {
  final int id;
  final String name;

  Ethnicity({
    required this.id,
    required this.name,
  });

  factory Ethnicity.fromJson(Map<String, dynamic> json) {
    return Ethnicity(
      id: json["id"],
      name: json["tenDanToc"],
    );
  }
}
