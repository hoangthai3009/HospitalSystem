import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget myTextField(TextEditingController controller, String labelText,
    {int length = 200,
    bool isNumber = false,
    bool haveIcon = false,
    VoidCallback? onIconPressed}) {
  ValueNotifier<String?> errorNotifier = ValueNotifier<String?>(null);
  FocusNode focusNode = FocusNode();

  focusNode.addListener(() {
    if (!focusNode.hasFocus) {
      // Kiểm tra khi mất tiêu điểm
      if (controller.text.isEmpty) {
        errorNotifier.value = 'Trường này không được để trống';
      } else {
        errorNotifier.value = null;
      }
    }
  });

  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, errorText, __) {
        return TextField(
          focusNode: focusNode,
          textCapitalization: TextCapitalization.words,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(length),
          ],
          decoration: InputDecoration(
            suffixIcon: haveIcon && controller.text.isNotEmpty
                ? TextButton(
                    onPressed: onIconPressed,
                    child: const Text('Kiểm Tra'),
                  )
                : null,
            labelText: labelText,
            border: const OutlineInputBorder(),
            errorText: errorText,
          ),
        );
      },
    ),
  );
}
