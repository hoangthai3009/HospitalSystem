import 'package:flutter/material.dart';

Widget myDropdown(List<String>? items, String? selectedValue,
    void Function(String?) onChanged, String labelText) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: DropdownButtonFormField<String>(
      value: selectedValue,
      items: items?.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}
