import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'setting_page.dart';
import 'start_screen.dart';

class PersonalisedRoutineScreen extends StatefulWidget {
  const PersonalisedRoutineScreen({Key? key}) : super(key: key);

  @override
  State<PersonalisedRoutineScreen> createState() =>
      _PersonalisedRoutineScreenState();
}

class _PersonalisedRoutineScreenState extends State<PersonalisedRoutineScreen> {
  int totalTime = 0;
  int timePerSequence = 0;
  int restTime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInputField(
              label: 'Total Time (minutes)',
              onChanged: (value) {
                setState(() {
                  totalTime = int.tryParse(value) ?? 0;
                });
              },
            ),
            _buildInputField(
              label: 'Time Per Sequence (seconds)',
              onChanged: (value) {
                setState(() {
                  timePerSequence = int.tryParse(value) ?? 0;
                });
              },
            ),
            _buildInputField(
              label: 'Rest Time (seconds)',
              onChanged: (value) {
                setState(() {
                  restTime = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to generate routine based on input
                _generateRoutine();
              },
              child: Text('Generate Routine'),
            ),
          ],
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

  Widget _buildInputField({
    required String label,
    required void Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  void _generateRoutine() {
    // Implement logic to generate routine based on input
    print('Generating Routine...');
    print('Total Time: $totalTime minutes');
    print('Time Per Sequence: $timePerSequence seconds');
    print('Rest Time: $restTime seconds');
    // Add your logic here
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
