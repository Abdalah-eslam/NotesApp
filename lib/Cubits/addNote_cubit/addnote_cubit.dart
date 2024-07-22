import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/constant/constantvalue.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  Color color = colorsList[1];

  addnote(Notemodel note) async {
    note.color = color.value;
    emit(AddnoteLoading());
    try {
      var notebox = Hive.box<Notemodel>(kprimarybox);

      await notebox.add(note);
      emit(AddnoteSucsses());
    } catch (e) {
      emit(AddnoteFailure(e.toString()));
    }
  }
}
