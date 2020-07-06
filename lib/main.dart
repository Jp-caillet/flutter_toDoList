import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/note/note_bloc.dart';
import 'package:flutter_bloc_demo/bloc/note/note_state.dart';
import 'package:flutter_bloc_demo/page/home/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => NoteBloc(UninitializedNoteState()),
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: TodoPage()));
  }
}
