import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/addNote_cubit/addnote_cubit.dart';
import 'package:note_app/Models/notemodel.dart';
import 'package:note_app/widgets/customTextfeild.dart';
import 'package:note_app/widgets/custombutton.dart';

class Formview extends StatefulWidget {
  const Formview({super.key});

  @override
  State<Formview> createState() => _FormviewState();
}

class _FormviewState extends State<Formview> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Customtextfeild(
            onsave: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          Customtextfeild(
            onsave: (value) {
              subtitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddnoteLoading ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    Notemodel note = Notemodel(
                        title: title!,
                        subtitle: subtitle!,
                        date: DateTime.now().toString(),
                        color: Colors.black.value);
                    BlocProvider.of<AddnoteCubit>(context).addnote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
