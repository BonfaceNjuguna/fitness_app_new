import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

import 'package:intl/intl.dart';

import 'exercise_history_controller.dart';
import 'user_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<ExerciseHistoryItem> historyItems = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  void _loadHistory() async {
    if (UserController.user != null) {
      final userId = UserController.user?.uid;
      final historyController = ExerciseHistoryController(userId!);

      // Load history from file using ExerciseHistoryController
      final List<ExerciseHistoryItem> items = await historyController.loadExerciseHistory(UserController.user!.uid);

      setState(() {
        historyItems = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: historyItems.isEmpty
          ? Center(
        child: const Text('No completed exercises yet.'),
      )
          : ListView.builder(
        itemCount: historyItems.length,
        itemBuilder: (context, index) {
          final item = historyItems[index];
          return ListTile(
            title: Text(item.exercise),
            subtitle: Text('Completed on: ${_formatDateTime(item.timestamp)}'),
          );
        },
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(dateTime);
  }
}