import 'package:flutter/material.dart';
import 'package:note_app/constant/constantvalue.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: kprimarycolor),
      child: const Center(
        child: Text(
          'Add',
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
