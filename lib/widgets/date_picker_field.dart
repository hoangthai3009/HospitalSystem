import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime?> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  return picked;
}

Widget myDatePickerField(
    TextEditingController controller, String labelText, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: InkWell(
      onTap: () async {
        final DateTime? picked = await selectDate(context);
        if (picked != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
          controller.text = formattedDate;
        }
      },
      child: IgnorePointer(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );
}
