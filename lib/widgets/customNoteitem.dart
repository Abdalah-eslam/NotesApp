import 'package:flutter/material.dart';
import 'package:note_app/views/editNoteview.dart';

class CustomNoteitem extends StatelessWidget {
  const CustomNoteitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) {
              return const Editnoteview();
            }),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Flutter Tips',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
                subtitle: const Text(
                  'this is a important Notes ',
                  style: TextStyle(fontSize: 24, color: Colors.black38),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_sweep,
                      size: 30,
                      color: Colors.black,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, right: 16),
                child: Text(
                  '12May , 2021',
                  style: TextStyle(fontSize: 22, color: Colors.black38),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
