import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return Scaffold(
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
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleControl,
                  decoration: InputDecoration(
                      hintText: 'Title', border: InputBorder.none),
                ),
                Expanded(
                    child: TextFormField(
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
      ),
    );
  }
}
