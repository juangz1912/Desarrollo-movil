import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final String collection = 'tasks';

  Future<String> create(Map<String, dynamic> task) async {
    try {
      DocumentReference response = await db.collection('tasks').add(task);
      return response.id;
    } catch (e) {
      print(e);
      return "";
    }
  }
}