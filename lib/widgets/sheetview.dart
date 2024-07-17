import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:note_app/widgets/customTextfeild.dart';
import 'package:note_app/widgets/custombutton.dart';

class Sheetview extends StatelessWidget {
  const Sheetview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Customtextfeild(
              hint: 'title',
            ),
            SizedBox(
              height: 16,
            ),
            Customtextfeild(
              hint: 'content',
              maxLines: 5,
            ),
            SizedBox(
              height: 100,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
