import 'package:flutter_bloc_demo/model/note_model.dart';

class NoteEvent {}

class AddNote extends NoteEvent {
  Note note;
  AddNote(this.note);
}

class RemoveNote extends NoteEvent {
  int index;
  RemoveNote(this.index);
}

class ResetNote extends NoteEvent {}
