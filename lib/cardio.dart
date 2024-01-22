import 'package:flutter/material.dart';

import 'base/exercise.dart';
import 'exercises_page.dart';
import 'profile_page.dart';
import 'setting_page.dart';
import 'start_screen.dart';

class CardioExercise extends Exercise {
  CardioExercise({
    required String name,
    required String focus,
    required String equipment,
    required String imageAsset,
    required String videoUrl,
  }) : super(
    name: name,
    focus: focus,
    equipment: equipment,
    imageAsset: imageAsset,
    videoUrl: videoUrl,
  );
}

CardioExercise jumpingJacks = CardioExercise(
  name: 'Jumping Jacks',
  focus: 'Cardio',
  equipment: 'None',
  imageAsset: 'assets/cardio/jumping_jack.png',
  videoUrl: 'assets/cardio/jumping_jack.mp4',
);

CardioExercise mountainClimbers = CardioExercise(
  name: 'Mountain Climbers',
  focus: 'Cardio',
  equipment: 'None',
  imageAsset: 'assets/cardio/mountain_climbers.png',
  videoUrl: 'assets/cardio/mountain_climbers.mp4',
);

class CardioScreen extends StatefulWidget {
  const CardioScreen({Key? key}) : super(key: key);

  @override
  State<CardioScreen> createState() => _CardioScreenState();
}

class _CardioScreenState extends State<CardioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Cardio',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              buildExerciseCard(exercise: jumpingJacks),
              const SizedBox(height: 10),
              buildExerciseCard(exercise: mountainClimbers),
              // Add more cardio exercises as needed
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _showStartScreen(context);
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _showSettingsDialog(context);
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _showProfileDialog(context);
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExerciseScreen(Exercise exercise) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExercisesScreen(exercise: exercise),
      ),
    );
  }

  Widget buildExerciseCard({
    required CardioExercise exercise,
  }) {
    return GestureDetector(
      onTap: () {
        _showExerciseScreen(exercise);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFE8EBEA),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    exercise.imageAsset,
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${exercise.name}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Focus: ${exercise.focus}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showStartScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StartScreen()),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void _showProfileDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }
}
