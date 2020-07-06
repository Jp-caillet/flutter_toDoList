import 'package:flutter_bloc_demo/model/note_model.dart';

class NoteState {}

class UninitializedNoteState extends NoteState {}

class HasValueNoteState extends NoteState {
  List<Note> notes;

  HasValueNoteState(this.notes);
}
