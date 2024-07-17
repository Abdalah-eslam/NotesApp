import 'package:flutter/material.dart';
import 'package:note_app/widgets/customTextfeild.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key});

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
                  onPressed: () {},
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
      body: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Customtextfeild(hint: 'Title'),
          SizedBox(
            height: 16,
          ),
          Customtextfeild(
            hint: 'Content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
