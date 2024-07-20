import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/constant/constantvalue.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());

  addnote(Notemodel note) async {
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
