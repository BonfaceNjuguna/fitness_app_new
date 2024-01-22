import 'package:flutter/material.dart';
import 'package:newfitnessapp/exercise_history_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'base/exercise.dart';
import 'user_controller.dart'; // Import the UserController

class ExercisesScreen extends StatefulWidget {
  final Exercise exercise;

  const ExercisesScreen({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  String videoDuration = "0:00"; // Store the video duration
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.exercise.videoUrl)
      ..initialize().then((_) {
        setState(() {
          // Calculate video duration and store it as a formatted string
          final duration = _controller.value.duration;
          final minutes = duration.inMinutes;
          final seconds = duration.inSeconds.remainder(60);
          videoDuration = '$minutes:${seconds.toString().padLeft(2, '0')}';
        });
      })
      ..addListener(() {
        // Check if the video is 3/4 watched and automatically mark as completed
        final currentDuration = _controller.value.position.inMilliseconds;
        final totalDuration = _controller.value.duration.inMilliseconds;
        final completionThreshold = totalDuration * 3 / 4;

        if (currentDuration >= completionThreshold && !isCompleted) {
          setState(() {
            isCompleted = true;
          });
          _saveToHistory(widget.exercise.name);
        }
      });

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery
                .of(context)
                .size
                .height / 2,
            child: Center(
              child: _controller.value.isInitialized
                  ? Container(
                color: Colors.black,
                child: Chewie(
                  controller: _chewieController,
                ),
              )
                  : const CircularProgressIndicator(),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height / 2,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Name: ${widget.exercise.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  'Focus: ${widget.exercise.focus}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  'Equipment: ${widget.exercise.equipment}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  'Time: $videoDuration', // Display the video duration
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: isCompleted,
                      onChanged: (value) {
                        if (value != null && value) {
                          setState(() {
                            isCompleted = true;
                          });
                          _saveToHistory(widget.exercise.name);
                        }
                      },
                    ),
                    const Text('Mark as Completed'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveToHistory(String exerciseName) async {
    print('Exercise name to be saved: $exerciseName');
    if (UserController.user != null) {
      try {
        final userId = UserController.user?.uid;
        final historyController = ExerciseHistoryController(userId!);
        // Mark exercise as completed
        await historyController.markExerciseCompleted(exerciseName);
        print('Exercise history saved successfully.');
      } catch (e) {
        print('Error saving exercise history: $e');
      }
    }
  }
}