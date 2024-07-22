import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/addNote_cubit/addnote_cubit.dart';
import 'package:note_app/constant/constantvalue.dart';

class Coloritem extends StatelessWidget {
  const Coloritem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 38,
              child: CircleAvatar(
                radius: 34,
                backgroundColor: color,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          );
  }
}

class ColorsListview extends StatefulWidget {
  const ColorsListview({super.key});

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int carruntColor = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              carruntColor = index;
              BlocProvider.of<AddnoteCubit>(context).color = colorsList[index];
              setState(() {});
            },
            child: Coloritem(
              isActive: carruntColor == index,
              color: colorsList[index],
            ),
          );
        },
      ),
    );
  }
}
