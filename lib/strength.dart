import 'package:flutter/material.dart';
import 'exercises_page.dart';
import 'profile_page.dart';
import 'setting_page.dart';
import 'start_screen.dart';

class StrengthScreen extends StatefulWidget {
  const StrengthScreen({Key? key}) : super(key: key);

  @override
  State<StrengthScreen> createState() => _StrengthScreenState();
}

class Exercise {
  final String name;
  final String focus;
  final String equipment;
  final String imageAsset;
  final String videoUrl;

  Exercise({
    required this.name,
    required this.focus,
    required this.equipment,
    required this.imageAsset,
    required this.videoUrl,
  });
}

class _StrengthScreenState extends State<StrengthScreen> {

  // Define a function to filter exercises by equipment
  List<Exercise> filterExercisesByEquipment(String equipment) {
    return exercises.where((exercise) => exercise.equipment == equipment).toList();
  }

  List<Exercise> exercises = [
    Exercise(
      name: 'Bent over row',
      focus: 'Back',
      equipment: 'Dumbbells',
      imageAsset: 'assets/reformer/Bent_over_row_thumbnail.png',
      videoUrl: 'assets/reformer/Bent_over_row_video.mp4',
    ),
    Exercise(
      name: 'Bicep curls',
      focus: 'Biceps',
      equipment: 'none',
      imageAsset: 'assets/reformer/Bicep_curls_thumbnail.png',
      videoUrl: 'assets/reformer/Bicep_curls_video.mp4',
    ),
    // Add more exercises here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Strength',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Section 1: Exercises with Equipment (e.g., Dumbbells)
              buildEquipmentSection("Dumbbells"),
              const SizedBox(height: 20),
              // Section 2: Exercises without Equipment
              buildEquipmentSection("None"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
                    // Handle settings icon click
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

  // Build a section of exercises based on equipment
  Widget buildEquipmentSection(String equipment) {
    final filteredExercises = filterExercisesByEquipment(equipment);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          equipment == "None" ? "Exercises without Equipment" : "Exercises with $equipment",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final exercise in filteredExercises)
                buildExerciseCard(
                  exercise: exercise,
                  onTap: () {

                  },
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildExerciseCard({
    required Exercise exercise,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            const SizedBox(width: 40),
            Expanded( // Use Expanded here
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
    );
  }
}
