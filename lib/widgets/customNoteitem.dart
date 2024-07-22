import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/views/editNoteview.dart';

class CustomNoteitem extends StatelessWidget {
  const CustomNoteitem({super.key, required this.note});
  final Notemodel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) {
              return Editnoteview(note: note);
            }),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(color: Color(note.color)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    note.title,
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
                subtitle: Text(
                  note.subtitle,
                  style: const TextStyle(fontSize: 24, color: Colors.black38),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllnotes();
                    },
                    icon: const Icon(
                      Icons.delete_sweep,
                      size: 30,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 16),
                child: Text(
                  note.date,
                  style: const TextStyle(fontSize: 22, color: Colors.black38),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
