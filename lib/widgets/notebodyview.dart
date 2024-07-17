import 'package:flutter/material.dart';
import 'package:note_app/widgets/customNoteitem.dart';

class notebodyview extends StatelessWidget {
  const notebodyview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(itemBuilder: (context, index) {
        return const CustomNoteitem();
      }),
    );
  }
}
