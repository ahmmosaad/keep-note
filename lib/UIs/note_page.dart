import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep/repo/repo.dart';

class NotePage extends StatefulWidget {

 final int index;

  const NotePage({ this.index});

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _titleControl = TextEditingController(
      text: ListRepo().pins[widget.index].title
    );
    TextEditingController _noteControl = TextEditingController(
        text: ListRepo().pins[widget.index].note
    );


    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.thumbtack), onPressed: () {}),
          IconButton(icon: Icon(Icons.add_alert), onPressed: () {}),
          IconButton(icon: Icon(FontAwesomeIcons.archive), onPressed: () {}),
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
                      style: TextStyle(fontSize: 16,),
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
