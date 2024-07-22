import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/Models/notemodel.dart';

import '../../constant/constantvalue.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<Notemodel>? notes;

  fetchAllnotes() {
    var notebox = Hive.box<Notemodel>(kprimarybox);

    notes = notebox.values.toList();
    emit(NotesSucsses());
  }
}
