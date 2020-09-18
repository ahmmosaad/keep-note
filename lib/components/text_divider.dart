import 'package:flutter/material.dart';

// ignore: camel_case_types
class Text_Divider extends StatelessWidget {
  final String section;
  const Text_Divider({this.section});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        section.toUpperCase(),
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
