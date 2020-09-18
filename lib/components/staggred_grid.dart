import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keep/components/home_note.dart';
import 'package:keep/models/note_model.dart';

// ignore: camel_case_types
class Staggered_grid extends StatelessWidget {
  final List<NoteModel> list;
  const Staggered_grid({this.list});

  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: 2,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => HomeNoteBox(
        title: list[index].title,
        note: list[index].note,
        i: index,
      ),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
    );
  }
}
