import 'package:flutter/material.dart';
import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/widgets/customNoteitem.dart';

class notebodyview extends StatelessWidget {
  const notebodyview({super.key, required this.notes});
  final List<Notemodel> notes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return CustomNoteitem(
              note: notes[index],
            );
          }),
    );
  }
}
