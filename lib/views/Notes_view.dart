import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/constant/constantvalue.dart';

import 'package:note_app/widgets/notebodyview.dart';
import 'package:note_app/widgets/sheetview.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllnotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<Notemodel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kprimarycolor,
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return const Sheetview();
                  });
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          appBar: AppBar(
            title: const Text(
              'Notes',
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: notebodyview(
            notes: notes,
          ),
        );
      },
    );
  }
}
