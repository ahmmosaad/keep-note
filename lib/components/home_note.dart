import 'package:flutter/material.dart';
import 'package:keep/UIs/note_page.dart';
import 'package:keep/repo/repo.dart';
import 'package:provider/provider.dart';

class HomeNoteBox extends StatelessWidget {
  final String title;
  final String note;
  final String id;

  const HomeNoteBox({this.title, this.note, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var prov = Provider.of<ListRepo>(context, listen: false);
        String title;
        String note;
        Map map;

        if (id == null) {
          title = '';
          note = '';
        } else if (id.contains('A')) {
          title = prov.general[id].title;
          note = prov.general[id].title;
          map = prov.general;
        } else if (id.contains('B')) {
          title = prov.archive[id].title;
          note = prov.archive[id].title;
          map = prov.archive;
        } else if (id.contains('D')) {
          title = prov.pins[id].title;
          note = prov.pins[id].title;
          map = prov.pins;
        }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NotePage(
                      map: map,
                      note: note,
                      title: title,
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
