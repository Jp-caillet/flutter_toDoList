import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/note/note_bloc.dart';
import 'package:flutter_bloc_demo/bloc/note/note_event.dart';
import 'package:flutter_bloc_demo/bloc/note/note_state.dart';
import 'package:flutter_bloc_demo/model/note_model.dart';

class TodoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final mytitleController = TextEditingController();
  final mytextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mytitleController.dispose();
    mytextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Boc demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) {
                if (state is UninitializedNoteState) {
                  return Text('');
                } else if (state is HasValueNoteState) {
                  return ListView.builder(
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 72.0),
                            title: Text(state.notes[index].nom),
                            subtitle: Text(state.notes[index].text),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                size: 30.0,
                                color: Colors.red[900],
                              ),
                              onPressed: () {
                                BlocProvider.of<NoteBloc>(context)
                                    .add(RemoveNote(index));
                              },
                            ),
                            isThreeLine: true,
                          ),
                        );
                      });
                }
                return Text('error');
              },
            ),
          ),
          Container(
            height: 32,
          ),
          Center(
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                mytitleController.text = "";
                mytextController.text = "";
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: mytitleController,
                                      decoration: InputDecoration(
                                          hintText: 'Enter a title'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: mytextController,
                                      decoration: InputDecoration(
                                          hintText: 'Enter a text'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      child: Text("creer une note"),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          BlocProvider.of<NoteBloc>(context)
                                              .add(AddNote(Note(
                                                  1,
                                                  mytitleController.text,
                                                  mytextController.text)));
                                          Navigator.of(context).pop();
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
