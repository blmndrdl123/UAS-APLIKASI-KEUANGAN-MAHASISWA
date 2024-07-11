import 'package:cloud_firestore/cloud_firestore.dart';

class NotesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNote(String userId, String title, String content) async {
    await _firestore.collection('notes').add({
      'userId': userId,
      'title': title,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getNotes(String userId) {
    return _firestore
        .collection('notes')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<void> updateNote(String docId, String title, String content) async {
    await _firestore.collection('notes').doc(docId).update({
      'title': title,
      'content': content,
    });
  }

  Future<void> deleteNote(String docId) async {
    await _firestore.collection('notes').doc(docId).delete();
  }
}
