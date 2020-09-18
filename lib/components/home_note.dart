import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keep/UIs/note_page.dart';

class HomeNoteBox extends StatelessWidget {
  final String title;
  final String note;
  final int i;

  const HomeNoteBox({this.title, this.note, this.i});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NotePage(
                      index: i,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.withOpacity(.3))),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.5)),
              overflow: TextOverflow.ellipsis,
            ),
            Divider(),
            Text(
              note,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(.7),
              ),
              maxLines: 10,
            )
          ],
        ),
      ),
    );
  }
}
