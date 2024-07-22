import 'package:flutter/material.dart';
import 'package:note_app/constant/constantvalue.dart';

class Customtextfeild extends StatelessWidget {
  const Customtextfeild({
    this.onsave,
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onChanged, // Default value for maxLines
  });
  final Function(String)? onChanged;
  final void Function(String?)? onsave;
  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onsave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This feild is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 20,
        ),
        border: inputBorder(),
        enabledBorder: inputBorder(),
        focusedBorder: inputBorder(),
      ),
    );
  }
}

OutlineInputBorder inputBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color ?? kprimarycolor),
  );
}
