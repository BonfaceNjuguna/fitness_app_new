import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'profile_page.dart';
import 'setting_page.dart';

class PersonalisedRoutineScreen extends StatefulWidget {
  const PersonalisedRoutineScreen({Key? key}) : super(key: key);

  @override
  State<PersonalisedRoutineScreen> createState() => _PersonalisedRoutineScreen();
}

class _PersonalisedRoutineScreen extends State<PersonalisedRoutineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set your desired app bar color
        elevation: 0.0, // Set elevation to 0.0 for no shadow
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Set the arrow color to black
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Center(
        child: Text('PR Screen'),
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

  Widget buildClickableTextWithIcon({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
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