/*
class Country {
  final String name;

  Country({required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
    );
  }
}
*/
class Country {
  final int id;
  final String name;
  final String? abbreviations;

  Country({
    required this.id,
    required this.name,
    this.abbreviations,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['tenQuocTich'],
      abbreviations: json['tenVietTat'],
    );
  }
}
