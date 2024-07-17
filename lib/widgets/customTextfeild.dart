import 'package:flutter/material.dart';
import 'package:note_app/constant/constantvalue.dart';

class Customtextfeild extends StatelessWidget {
  const Customtextfeild({super.key, required this.hint});
  final String hint;
  // final int maxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
