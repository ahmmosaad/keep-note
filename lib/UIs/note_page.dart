import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep/models/note_model.dart';
import 'package:keep/repo/repo.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  final String title;
  final String note;
  final Map map;

  const NotePage({this.title, this.map, this.note});

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ListRepo>(context, listen: false);

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
