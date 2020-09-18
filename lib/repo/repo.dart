import 'package:flutter/cupertino.dart';
import 'package:keep/models/lable_model.dart';
import 'package:keep/models/note_model.dart';

class ListRepo extends ChangeNotifier {
  Map<String, NoteModel> general = {
    '1A': NoteModel(
      title: 'geneeral 1 test',
      note: 'this is test general one test tp see of app ',
      editDate: DateTime.now(),
    ),
    '2A': NoteModel(
      title: '2 test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
  };
  Map<String, NoteModel> archive = {
    '1B': NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
    '2B': NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
  };
  Map<String, NoteModel> pins = {
    '1C': NoteModel(
      title: 'test',
      note:
          'this is test, this is test, this is test ,this is test, this is test, this is test',
      editDate: DateTime.now(),
    ),
    '2C': NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
    '3C': NoteModel(
      title: 'test',
      note:
          'this is test, this is test, this is test ,this is test, this is test, this is test',
      editDate: DateTime.now(),
    ),
    '4C': NoteModel(
      title: 'test',
      note:
          'this is test, this is test, this is test ,this is test, this is test, this is test',
      editDate: DateTime.now(),
    ),
    '5C': NoteModel(
      title: 'test',
      note: 'this is test',
      editDate: DateTime.now(),
    ),
  };
  Map<String, NoteModel> deleted = {};
  Map<String, LabelModel> labels = {};

  //add new note to general
  void addNewNote(NoteModel newNoteModel) {
    general.putIfAbsent('${general.length + 1}A', () {
      return newNoteModel;
    });
    notifyListeners();
  }

  //pin a massage
  void pining(String key) {
    pins.putIfAbsent('${pins.length + 1}C', () {
      return general[key];
    });
    general.remove(key);
    notifyListeners();
  }

  // remove from general to archive
  void addToArchive(String key, Map map) {
    archive.putIfAbsent('${archive.length + 1}B', () {
      return map[key];
    });
    general.remove(key);
    notifyListeners();
  }

  // remove from general to deleteList
  void deleteFromGeneral(String key, Map map) {
    deleted.putIfAbsent('${general.length + 1}A', () {
      return map[key];
    });
    map.remove(key);
    notifyListeners();
  }

  // permenant remove note
  void permDelete(String key) {
    deleted.remove(key);
    notifyListeners();
  }
}
