import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType { text, number, email }

Widget myTextField(
  TextEditingController controller,
  String labelText, {
  int length = 200,
  InputType inputType = InputType.text,
  bool haveIcon = false,
  VoidCallback? onIconPressed,
}) {
  ValueNotifier<String?> errorNotifier = ValueNotifier<String?>(null);
  FocusNode focusNode = FocusNode();

  focusNode.addListener(() {
    if (!focusNode.hasFocus) {
      if (controller.text.isEmpty) {
        errorNotifier.value = 'Trường này không được để trống';
      } else {
        errorNotifier.value = null;
      }
    }
  });

  TextInputType getKeyboardType() {
    switch (inputType) {
      case InputType.number:
        return TextInputType.number;
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.text:
      default:
        return TextInputType.text;
    }
  }

  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, errorText, __) {
        return TextField(
          focusNode: focusNode,
          textCapitalization: TextCapitalization.words,
          keyboardType: getKeyboardType(),
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(length),
            if (inputType == InputType.number) FilteringTextInputFormatter.digitsOnly,
          ],
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
          decoration: InputDecoration(
            suffixIcon: haveIcon
                ? IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: onIconPressed,
                  )
                : null,
            labelText: labelText,
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2.0,
              ),
            ),
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
          ),
        );
      },
    ),
  );
}
