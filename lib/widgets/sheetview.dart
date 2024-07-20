import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/Cubits/addNote_cubit/addnote_cubit.dart';
import 'package:note_app/widgets/formview.dart';

class Sheetview extends StatelessWidget {
  const Sheetview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<AddnoteCubit, AddnoteState>(
          listener: (context, state) {
            if (state is AddnoteSucsses) {
              Navigator.pop(context);
            }
            if (state is AddnoteFailure) {
              debugPrint('failed ${state.errmassage}');
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddnoteLoading ? true : false,
              child: SingleChildScrollView(
                child: Formview(),
              ),
            );
          },
        ),
      ),
    );
  }
}
