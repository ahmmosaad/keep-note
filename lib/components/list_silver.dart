import 'package:flutter/material.dart';
import 'package:keep/models/note_model.dart';
import 'package:keep/components/home_note.dart';

// ignore: camel_case_types
class List_sliver extends StatelessWidget {
  final List<NoteModel> list;

  const List_sliver({
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      ((context, index) {
        return HomeNoteBox(
          i: index,
          note: list[index].note,
          title: list[index].title,
        );
      }),
      childCount: list.length,
    ));
  }
}
