import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keep/components/home_note.dart';
import 'package:keep/models/note_model.dart';

// ignore: camel_case_types
class Staggered_grid extends StatelessWidget {
  final Map<String, NoteModel> map;
  const Staggered_grid({this.map});

  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: 2,
      itemCount: map.values.length,
      itemBuilder: (BuildContext context, int index) => HomeNoteBox(
        title: map.values.toList()[index].title,
        note: map.values.toList()[index].note,
        id: map.keys.toList()[index],
      ),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
    );
  }
}
