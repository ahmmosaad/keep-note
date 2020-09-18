import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep/models/note_model.dart';
import 'package:keep/repo/repo.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  final int index;

  const NotePage({this.index});

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleControl = TextEditingController(
        text: widget.index == null ? '' : ListRepo().pins[widget.index].title);
    TextEditingController _noteControl = TextEditingController(
        text: widget.index == null ? '' : ListRepo().pins[widget.index].note);

    String title;
    String note;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            Provider.of<ListRepo>(context, listen: false).addNewNote(NoteModel(
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
                Provider.of<ListRepo>(context, listen: false)
                    .pining(widget.index);
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
                Provider.of<ListRepo>(context, listen: false)
                  ..addToArchive(widget.index);
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
                    _titleControl.text = title;
                  });
                },
                controller: _titleControl,
                decoration: InputDecoration(
                    hintText: 'Title', border: InputBorder.none),
              ),
              Expanded(
                  child: TextFormField(
                onChanged: (note) {
                  setState(() {
                    note = note;
                    _noteControl.text = note;
                  });
                },
                controller: _noteControl,
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
