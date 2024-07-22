import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/widgets/customTextfeild.dart';

class Editnoteview extends StatefulWidget {
  const Editnoteview({super.key, required this.note});
  final Notemodel note;

  @override
  State<Editnoteview> createState() => _EditnoteviewState();
}

class _EditnoteviewState extends State<Editnoteview> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Note',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.subtitle = subtitle ?? widget.note.subtitle;
                    widget.note.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllnotes();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.check,
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Customtextfeild(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          Customtextfeild(
            onChanged: (p0) {
              subtitle = p0;
            },
            hint: widget.note.subtitle,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
