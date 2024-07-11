import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/services/auth_service.dart';
import '/services/notes_service.dart';

class NotesScreen extends StatelessWidget {
  final NotesService _notesService = NotesService();
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _notesService.getNotes(_currentUser!.uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var notes = snapshot.data!.docs;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              var note = notes[index];
              return ListTile(
                title: Text(note['title']),
                subtitle: Text(note['content']),
                onTap: () {
                  _showNoteDialog(
                      context, note.id, note['title'], note['content']);
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _notesService.deleteNote(note.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showNoteDialog(context);
        },
      ),
    );
  }

  void _showNoteDialog(BuildContext context,
      [String? docId, String? title, String? content]) {
    final _titleController = TextEditingController(text: title);
    final _contentController = TextEditingController(text: content);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(docId == null ? 'Add Note' : 'Update Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Save'),
            onPressed: () {
              if (docId == null) {
                _notesService.addNote(
                  _currentUser!.uid,
                  _titleController.text,
                  _contentController.text,
                );
              } else {
                _notesService.updateNote(
                  docId,
                  _titleController.text,
                  _contentController.text,
                );
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
