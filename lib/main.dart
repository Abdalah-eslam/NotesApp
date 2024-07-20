import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/constant/constantvalue.dart';
import 'package:note_app/simpleblocobserver.dart';
import 'package:note_app/views/Notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NotemodelAdapter());
  await Hive.openBox<Notemodel>(kprimarybox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const NotesView(),
    );
  }
}
