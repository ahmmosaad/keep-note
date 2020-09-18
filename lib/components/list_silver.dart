import 'package:flutter/material.dart';
import 'package:keep/components/home_note.dart';

// ignore: camel_case_types
class List_sliver extends StatelessWidget {
  final Map map;

  const List_sliver({
    this.map,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      ((context, index) {
        return HomeNoteBox(
          id: map.keys.toList()[index].note,
          note: map.values.toList()[index].note,
          title: map.values.toList()[index].title,
        );
      }),
      childCount: map.values.length,
    ));
  }
}
