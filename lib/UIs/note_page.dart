import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep/models/note_model.dart';
import 'package:keep/repo/repo.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  final String id;

  const NotePage({
    this.id,
  });

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ListRepo>(context, listen: false);
    String title;
    String note;
    Map map;

    @override
// ignore: unused_element
    void didChangeDependencies() {
      if (widget.id == null) {
        title = '';
        note = '';
      } else if (widget.id.contains('A')) {
        title = prov.general[widget.id].title;
        note = prov.general[widget.id].title;
        map = prov.general;
      } else if (widget.id.contains('B')) {
        title = prov.archive[widget.id].title;
        note = prov.archive[widget.id].title;
        map = prov.archive;
      } else if (widget.id.contains('D')) {
        title = prov.pins[widget.id].title;
        note = prov.pins[widget.id].title;
        map = prov.pins;
      }

      super.didChangeDependencies();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            prov.addNewNote(NoteModel(
              title: title,
              note: note,
            ));
          }),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.thumbtack,
                size: 20,
              ),
              onPressed: () {
                prov.pining(widget.id);
              }),
          IconButton(
              icon: Icon(
                Icons.add_alert,
                size: 20,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.archive,
                size: 20,
              ),
              onPressed: () {
                prov.addToArchive(widget.id, map);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                onChanged: (title) {
                  setState(() {
                    title = title;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Title', border: InputBorder.none),
              ),
              Expanded(
                  child: TextFormField(
                onChanged: (note) {
                  setState(() {
                    note = note;
                  });
                },
                style: TextStyle(
                  fontSize: 16,
                ),
                expands: true,
                minLines: null,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Note',
                  border: InputBorder.none,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
