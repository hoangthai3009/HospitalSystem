import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:giao_dien_app_benh_vien/models/history.dart';
import 'package:giao_dien_app_benh_vien/widgets/date_picker_field.dart';

class BookingListPage extends StatefulWidget {
  final List<History> historyList;

  const BookingListPage({super.key, required this.historyList});

  @override
  State<BookingListPage> createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  TextEditingController _toDateController = TextEditingController();
  TextEditingController _fromDateController = TextEditingController();
  late List<History> _filteredHistoryList;

  @override
  void initState() {
    super.initState();
    _filteredHistoryList = widget.historyList;
    _fromDateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime(1900)),
    );
    _toDateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );
  }

  void _filterHistoryList() {
    DateTime? fromDate;
    DateTime? toDate;

    if (_fromDateController.text.isNotEmpty) {
      fromDate = DateFormat('dd/MM/yyyy').parse(_fromDateController.text);
    }
    if (_toDateController.text.isNotEmpty) {
      toDate = DateFormat('dd/MM/yyyy').parse(_toDateController.text);
    }

    setState(() {
      _filteredHistoryList = widget.historyList.where((history) {
        final DateTime medicalExaminationDay = DateTime.parse(history.medicalExaminationDay);
        if (fromDate != null && medicalExaminationDay.isBefore(fromDate)) {
          return false;
        }
        if (toDate != null && medicalExaminationDay.isAfter(toDate)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Danh Sách Đăng Ký Khám'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: myDatePickerField(
                          _fromDateController,
                          'Bắt Đầu',
                          context,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: myDatePickerField(
                          _toDateController,
                          'Kết Thúc',
                          context,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _filterHistoryList,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    child: const Text(
                      'Lọc',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredHistoryList.length,
                itemBuilder: (context, position) {
                  final history = _filteredHistoryList[position];
                  final DateTime medicalExaminationDay = DateTime.parse(history.medicalExaminationDay);
                  final DateTime createdDay = DateTime.parse(history.createdDay);

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                        child: Text(
                          history.ordinalNumber.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        'Ngày khám: ${dateFormat.format(medicalExaminationDay)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        history.detailedDiagnosticStandards ?? "Chỉ định",
                      ),
                      trailing: Text(
                        dateFormat.format(createdDay),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
