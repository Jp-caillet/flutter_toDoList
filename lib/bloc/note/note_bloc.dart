import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/note/note_event.dart';
import 'package:flutter_bloc_demo/bloc/note/note_state.dart';
import 'package:flutter_bloc_demo/repository/note_repository.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc(NoteState initialState) : super(initialState);

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    NoteRepository noteRepository = NoteRepository();

    if (event is AddNote) {
      noteRepository.note.add(event.note);
      yield HasValueNoteState(noteRepository.note);
    } else if (event is RemoveNote) {
      noteRepository.note.removeAt(event.index);
      yield HasValueNoteState(noteRepository.note);
    } else if (event is ResetNote) {
      yield UninitializedNoteState();
    }
  }
}
