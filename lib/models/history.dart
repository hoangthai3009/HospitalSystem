class History {
  int id;
  int ordinalNumber;
  String medicalExaminationDay;
  String createdDay;
  String medicalExaminationTime;
  String? description;
  String? detailedDiagnosticStandards;
  String? advice;

  History({
    required this.id,
    required this.ordinalNumber,
    required this.medicalExaminationDay,
    required this.createdDay,
    required this.medicalExaminationTime,
    required this.description,
    required this.detailedDiagnosticStandards,
    required this.advice,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      ordinalNumber: json['stt'],
      medicalExaminationDay: json['ngayKham'],
      createdDay: json['ngayTao'],
      medicalExaminationTime: json['gioKham'],
      description: json['moTa'],
      detailedDiagnosticStandards: json['chiTietChuanDoan'],
      advice: json['loiDan'],
    );
  }
}
