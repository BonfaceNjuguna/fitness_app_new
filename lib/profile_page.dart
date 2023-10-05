import 'package:flutter/material.dart';


import 'setting_page.dart';
import 'start_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Page Content'),
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
                    // Handle profile icon click
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.orange,
                  ),
                ),
                const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.orange,
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
          const SizedBox(height: 10), // Removed 'const' here
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

  void _showSettingsDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void _showStartScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StartScreen()),
    );
  }
}
