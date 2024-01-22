import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseHistoryController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _historyCollection;

  ExerciseHistoryController(String userId) {
    _historyCollection = _firestore.collection('users').doc(userId).collection(
        'exerciseHistory');
  }

  // Mark exercise as completed with timestamp
  Future<void> markExerciseCompleted(String exerciseName) async {
    try {
      await _historyCollection.add({
        'exercise': exerciseName,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error marking exercise as completed: $e');
    }
  }

  // Load completed exercises
  Future<List<ExerciseHistoryItem>> loadExerciseHistory(String userId) async {
    try {
      final querySnapshot = await _historyCollection.get();
      final List<ExerciseHistoryItem> items = [];

      for (final doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;

        if (data.containsKey('exercise') && data.containsKey('timestamp')) {
          final exerciseName = data['exercise'] as String;
          final timestamp = (data['timestamp'] as Timestamp).toDate();
          items.add(ExerciseHistoryItem(exerciseName, timestamp));
        } else {
          print('Exercise field missing in document: ${doc.id}');
        }
      }

      return items;
    } catch (e) {
      print('Error loading exercise history: $e');
      return [];
    }
  }
}


  class ExerciseHistoryItem {
  final String exercise;
  final DateTime timestamp;

  ExerciseHistoryItem(this.exercise, this.timestamp);
}
