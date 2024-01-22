import 'package:flutter/material.dart';

import 'base/exercise.dart';
import 'exercises_page.dart';
import 'profile_page.dart';
import 'setting_page.dart';
import 'start_screen.dart';

class ReformerExercise extends Exercise {
  ReformerExercise({
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

class ReformerScreen extends StatefulWidget {
  const ReformerScreen({Key? key}) : super(key: key);

  @override
  State<ReformerScreen> createState() => _ReformerScreenState();
}

class _ReformerScreenState extends State<ReformerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white, // Set the background color to white
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black, // Set the arrow color to black
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Reformer',
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
              Row(
                children: [
                  Image.asset(
                    'assets/reformer/biceps_icon.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Biceps',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExerciseCard(
                      exercise: bentOverRow,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: bentOverRow),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/reformer/triceps_icon.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Triceps',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExerciseCard(
                      exercise: tricepsDips,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: tricepsDips),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    buildExerciseCard(
                      exercise: skullCrusher,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: skullCrusher),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/reformer/back_icon.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExerciseCard(
                      exercise: bentOverRow,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: bentOverRow),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    buildExerciseCard(
                      exercise: trxRows,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: trxRows),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/reformer/chest_icon.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Chest',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExerciseCard(
                      exercise: inclineChest,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: inclineChest),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    buildExerciseCard(
                      exercise: pushUp,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: pushUp),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/reformer/shoulder_icon.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Shoulder',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExerciseCard(
                      exercise: shoulderShrug,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(exercise: shoulderShrug),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    buildExerciseCard(
                      exercise: overheadShoulderPress,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExercisesScreen(
                                    exercise: overheadShoulderPress),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 110, // Adjust the height as needed
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

  Exercise bentOverRow = Exercise(
    name: 'Bent over row',
    focus: 'Back',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Bent_over_row_thumbnail.png',
    videoUrl: 'assets/reformer/Bent_over_row_video.mp4',
  );

  Exercise bicepCurls = Exercise(
    name: 'Bicep curls',
    focus: 'Biceps',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Bicep_curls_thumbnail.png',
    videoUrl: 'assets/reformer/Bicep_curls_video.mp4',
  );

  Exercise hammerCurls = Exercise(
    name: 'Hammer curls',
    focus: 'Biceps',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Hammer_curls_thumbnail.png',
    videoUrl: 'assets/reformer/Hammer_curls_video.mp4',
  );

  Exercise inclineChest = Exercise(
    name: 'Incline chest press',
    focus: 'Chest',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Incline_chest_press_thumbnail.png',
    videoUrl: 'assets/reformer/Incline_chest_press_video.mp4',
  );

  Exercise overheadShoulderPress = Exercise(
    name: 'Overhead shoulder press',
    focus: 'Shoulders',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Overheard_shoulder_press_thumbnail.png',
    videoUrl: 'assets/reformer/Overheard_shoulder_press_video.mp4',
  );

  Exercise pushUp = Exercise(
    name: 'Push up',
    focus: 'Chest',
    equipment: 'None',
    imageAsset: 'assets/reformer/Push_up_thumbnail.png',
    videoUrl: 'assets/reformer/Push_up_video.mp4',
  );

  Exercise reverseDumbbellFlies = Exercise(
    name: 'Reverse dumbbell flies',
    focus: 'Back',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Reverse_dumbbell_flies_thumbnail.png',
    videoUrl: 'assets/reformer/Reverse_dumbbell_flies_video.mp4',
  );

  Exercise shoulderShrug = Exercise(
    name: 'Shoulder shrug',
    focus: 'Shoulders',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Shoulder_shrug_thumbnail.png',
    videoUrl: 'assets/reformer/Shoulder_shrug_video.mp4',
  );

  Exercise skullCrusher = Exercise(
    name: 'Skull crusher',
    focus: 'Triceps',
    equipment: 'Dumbbells',
    imageAsset: 'assets/reformer/Skull_crusher_thumbnail.png',
    videoUrl: 'assets/reformer/Skull_crusher_video.mp4',
  );

  Exercise tricepsDips = Exercise(
    name: 'Triceps dips',
    focus: 'Triceps',
    equipment: 'Parallel bars',
    imageAsset: 'assets/reformer/Triceps_dips_thumbnail.png',
    videoUrl: 'assets/reformer/Triceps_dips_video.mp4',
  );

  Exercise trxRows = Exercise(
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

  Widget buildExerciseCard({
    required Exercise exercise,
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