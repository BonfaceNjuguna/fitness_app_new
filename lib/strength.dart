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

class StrengthExercise {
  final String name;
  final String focus;
  final String equipment;
  final String imageAsset;
  final String videoUrl;

  StrengthExercise({
    required this.name,
    required this.focus,
    required this.equipment,
    required this.imageAsset,
    required this.videoUrl,
  });
}

class _StrengthScreenState extends State<StrengthScreen> {
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
          'Strength',
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
              buildCategorySection(
                categoryTitle: 'With Equipment',
                exercises: [
                  bentOverRow,
                  bicepCurls,
                  hammerCurls,
                  inclineChest,
                  overheadShoulderPress,
                  reverseDumbbellFlies,
                  shoulderShrug,
                  skullCrusher,
                  tricepsDips,
                  trxRows,
                ],
              ),
              const SizedBox(height: 20),
              buildCategorySection(
                categoryTitle: 'Without Equipment',
                exercises: [pushUp],
              ),
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

  StrengthExercise bentOverRow = StrengthExercise(
    name: 'Bent over row',
    focus: 'Back',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Bent_over_row_thumbnail.png',
    videoUrl: 'assets/reformer/Bent_over_row_video.mp4',
  );

  StrengthExercise bicepCurls = StrengthExercise(
    name: 'Bicep curls',
    focus: 'Biceps',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Bicep_curls_thumbnail.png',
    videoUrl: 'assets/reformer/Bicep_curls_video.mp4',
  );

  StrengthExercise hammerCurls = StrengthExercise(
    name: 'Hammer curls',
    focus: 'Biceps',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Hammer_curls_thumbnail.png',
    videoUrl: 'assets/reformer/Hammer_curls_video.mp4',
  );

  StrengthExercise inclineChest = StrengthExercise(
    name: 'Incline chest press',
    focus: 'Chest',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Incline_chest_press_thumbnail.png',
    videoUrl: 'assets/reformer/Incline_chest_press_video.mp4',
  );

  StrengthExercise overheadShoulderPress = StrengthExercise(
    name: 'Overhead shoulder press',
    focus: 'Shoulders',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Overheard_shoulder_press_thumbnail.png',
    videoUrl: 'assets/reformer/Overheard_shoulder_press_video.mp4',
  );

  StrengthExercise pushUp = StrengthExercise(
    name: 'Push up',
    focus: 'Chest',
    equipment: 'None',
    imageAsset: 'assets/reformer/Push_up_thumbnail.png',
    videoUrl: 'assets/reformer/Push_up_video.mp4',
  );

  StrengthExercise reverseDumbbellFlies = StrengthExercise(
    name: 'Reverse dumbbell flies',
    focus: 'Back',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Reverse_dumbbell_flies_thumbnail.png',
    videoUrl: 'assets/reformer/Reverse_dumbbell_flies_video.mp4',
  );

  StrengthExercise shoulderShrug = StrengthExercise(
    name: 'Shoulder shrug',
    focus: 'Shoulders',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Shoulder_shrug_thumbnail.png',
    videoUrl: 'assets/reformer/Shoulder_shrug_video.mp4',
  );

  StrengthExercise skullCrusher = StrengthExercise(
    name: 'Skull crusher',
    focus: 'Triceps',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Skull_crusher_thumbnail.png',
    videoUrl: 'assets/reformer/Skull_crusher_video.mp4',
  );

  StrengthExercise tricepsDips = StrengthExercise(
    name: 'Triceps dips',
    focus: 'Triceps',
    equipment: 'Parallel bars',
    imageAsset: 'assets/reformer/Triceps_dips_thumbnail.png',
    videoUrl: 'assets/reformer/Triceps_dips_video.mp4',
  );

  StrengthExercise trxRows = StrengthExercise(
    name: 'TRX rows',
    focus: 'Back',
    equipment: 'TRX straps',
    imageAsset: 'assets/reformer/TRX_rows_thumbnail.png',
    videoUrl: 'assets/reformer/TRX_rows_video.mp4',
  );

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

  Widget buildCategorySection({
    required String categoryTitle,
    required List<StrengthExercise> exercises,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: exercises.map((exercise) {
            return buildExerciseCard(
              exercise: exercise,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExercisesScreen(exercise: exercise),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildExerciseCard({
    required StrengthExercise exercise,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack( // Use a Stack to overlay the button
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
}