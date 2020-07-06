import 'package:flutter_bloc_demo/model/note_model.dart';

class NoteRepository {
  List<Note> note = [];

  static final NoteRepository _noteRepository = NoteRepository._internal();

  factory NoteRepository() {
    return _noteRepository;
  }

  NoteRepository._internal();
}
