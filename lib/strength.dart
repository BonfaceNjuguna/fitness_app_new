import 'package:flutter/material.dart';
import 'package:newfitnessapp/base/exercise.dart';
import 'exercises_page.dart';
import 'profile_page.dart';
import 'setting_page.dart';
import 'start_screen.dart';

class StrengthExercise extends Exercise {
  final String subcategory;

  StrengthExercise({
    required String name,
    required String focus,
    required String equipment,
    required String imageAsset,
    required String videoUrl,
    required this.subcategory,
  }) : super(
    name: name,
    focus: focus,
    equipment: equipment,
    imageAsset: imageAsset,
    videoUrl: videoUrl,
  );
}

class StrengthScreen extends StatefulWidget {
  const StrengthScreen({Key? key}) : super(key: key);

  @override
  _StrengthScreenState createState() => _StrengthScreenState();
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
                subcategories: ['Glutes', 'Thighs', 'Back'],
                exercises: [
                  bulgarianSplitSquats,
                  goodMornings,
                  hipThrusts,
                  legPushBack,
                  romanianDeadlift,
                  singleLegFluteBridge,
                  splitSquats,
                  sumoSquats,
                  standingFireHydrant,
                ],
              ),
              const SizedBox(height: 20),
              buildCategorySection(
                categoryTitle: 'Without Equipment',
                subcategories: ['Glutes'],
                exercises: [
                  standingLunge,

                ],
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
      ),
    );
  }

  StrengthExercise bulgarianSplitSquats = StrengthExercise(
    name: 'Bulgarian Split Squats',
    focus: 'Glutes',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Bulgarian_split_squat.png',
    videoUrl: 'assets/strength/Bulgarian_split_squat.mp4',
    subcategory: 'Glutes',
  );

  StrengthExercise goodMornings = StrengthExercise(
    name: 'Good Mornings',
    focus: 'Back',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Good_mornings.png',
    videoUrl: 'assets/strength/Good_mornings.mp4',
    subcategory: 'Back',
  );

  StrengthExercise hipThrusts = StrengthExercise(
    name: 'Hip Thrusts',
    focus: 'Glutes',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Hip_thrusts.png',
    videoUrl: 'assets/strength/Hip_thrusts.mp4',
    subcategory: 'Glutes',
  );

  StrengthExercise legPushBack = StrengthExercise(
    name: 'Leg Push Back',
    focus: 'Glutes',
    equipment: 'name',
    imageAsset: 'assets/strength/Leg_push_back.png',
    videoUrl: 'assets/strength/Leg_push_back.mp4',
    subcategory: 'Glutes',
  );

  StrengthExercise romanianDeadlift = StrengthExercise(
    name: 'Romanian Deadlift',
    focus: 'Glutes',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Romanian_deadlift.png',
    videoUrl: 'assets/strength/Romanian_deadlift.mp4',
    subcategory: 'Glutes',
  );

  StrengthExercise singleLegFluteBridge = StrengthExercise(
    name: 'Single Leg Flute Bridge',
    focus: 'Glutes',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Single_leg_flute_bridge.png',
    videoUrl: 'assets/strength/Single_leg_flute_bridge.mp4',
    subcategory: 'Glutes',
  );

  StrengthExercise splitSquats = StrengthExercise(
    name: 'Split Squats',
    focus: 'Glutes',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Split_squats.png',
    videoUrl: 'assets/strength/Split_squats.mp4',
    subcategory: 'Glutes',
  );

  StrengthExercise standingFireHydrant = StrengthExercise(
    name: 'Standing Fire Hydrants',
    focus: 'Thighs',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Standing_fire_hydrants.png',
    videoUrl: 'assets/strength/Standing_fire_hydrants.mp4',
    subcategory: 'Thighs',
  );

  StrengthExercise standingLunge = StrengthExercise(
    name: 'Standing Lunge',
    focus: 'Glutes',
    equipment: 'None',
    imageAsset: 'assets/strength/Standing_lunge.png',
    videoUrl: 'assets/strength/Standing_lunge.mp4',
    subcategory: 'Glutes',
  );

  StrengthExercise sumoSquats = StrengthExercise(
    name: 'Sumo Squats',
    focus: 'Glutes',
    equipment: 'Dumbbells',
    imageAsset: 'assets/strength/Sumo_squats.png',
    videoUrl: 'assets/strength/Sumo_squats.mp4',
    subcategory: 'Glutes',
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

  void _showExerciseDetails(BuildContext context, StrengthExercise exercise) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExercisesScreen(exercise: exercise),
      ),
    );
  }

  Widget buildCategorySection({
    required String categoryTitle,
    required List<String> subcategories,
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
          children: subcategories.map((subcategory) {
            final subcategoryExercises = exercises.where((exercise) => exercise.subcategory == subcategory).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subcategory,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: subcategoryExercises.asMap().entries.map((entry) {
                    final index = entry.key;
                    final exercise = entry.value;
                    return Column(
                      children: [
                        buildExerciseCard(
                          exercise: exercise,
                          onTap: () {
                            // Handle exercise card tap if needed
                            _showExerciseDetails(context, exercise);
                          },
                        ),
                        if (index < subcategoryExercises.length - 1) // Add spacing if not the last exercise
                          const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],
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
