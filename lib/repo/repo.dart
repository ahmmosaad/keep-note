import 'package:flutter/cupertino.dart';
import 'package:keep/models/lable_model.dart';
import 'package:keep/models/note_model.dart';

class ListRepo extends ChangeNotifier {
  List<NoteModel> general = [
    NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
    NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
  ];
  List<NoteModel> archive = [
    NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
    NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
  ];
  List<NoteModel> pins = [
    NoteModel(
      title: 'test',
      note:
          'this is test, this is test, this is test ,this is test, this is test, this is test',
      editDate: DateTime.now(),
    ),
    NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
    NoteModel(
      title: 'test',
      note:
          'this is test, this is test, this is test ,this is test, this is test, this is test',
      editDate: DateTime.now(),
    ),
    NoteModel(
      title: 'test',
      note:
          'this is test, this is test, this is test ,this is test, this is test, this is test',
      editDate: DateTime.now(),
    ),
    NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
  ];
  List<NoteModel> deleted = [];
  List<LabelModel> labels = [
    LabelModel(label: 'Book'),
    LabelModel(label: 'Book'),
    LabelModel(label: 'Book'),
  ];

  //add new note to general
  void addNewNote(NoteModel noteModel) {
    general.add(noteModel);
    notifyListeners();
  }

  //pin a massage
  void pining(int index) {
    pins.add(general[index]);
    general.removeAt(index);
    notifyListeners();
  }

  // remove from general to archive
  void addToArchive(int index) {
    archive.add(general[index]);
    general.removeAt(index);
    notifyListeners();
  }

  // remove from general to deleteList
  void deleteFromGeneral(int index) {
    deleted.add(general[index]);
    general.removeAt(index);
    notifyListeners();
  }

  // permenant remove note
  void permDelete(int index) {
    deleted.removeAt(index);
    notifyListeners();
  }

  //add new label
  void addLabel(LabelModel label) {
    labels.add(label);
    notifyListeners();
  }
}
