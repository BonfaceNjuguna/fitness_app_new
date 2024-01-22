import 'package:flutter/material.dart';
import 'package:newfitnessapp/home.dart';
import 'setting_page.dart';
import 'start_screen.dart';
import 'user_controller.dart';
import 'history_screen.dart'; // Import the HistoryScreen

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hello ${UserController.user?.displayName ?? ''}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildProfileOption(
                    context: context, // Pass the context directly
                    icon: Icons.history,
                    label: 'My Workout History',
                    onTap: () {
                      _navigateToHistoryScreen(context);
                    },
                  ),
                  _buildProfileOption(
                    context: context, // Pass the context directly
                    icon: Icons.settings,
                    label: 'Settings',
                    onTap: () {
                      _showSettingsDialog(context);
                    },
                  ),
                  _buildProfileOption(
                    context: context, // Pass the context directly
                    icon: Icons.exit_to_app,
                    label: 'Logout',
                    onTap: () {
                      _signOutAndNavigateToStartScreen(context);
                    },
                  ),
                  // Add more options as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onHomePressed: () {
          _showStartScreen(context);
        },
        onSettingsPressed: () {
          _showSettingsDialog(context);
        },
        onProfilePressed: () {
          // Do nothing, as you are already on the profile page
        },
      ),
    );
  }

  Widget _buildProfileOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        if (label == 'My Workout History') {
          _navigateToHistoryScreen(context);
        } else {
          onTap();
        }
      },
    );
  }

  void _navigateToHistoryScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryScreen()),
    );
  }

  void _signOutAndNavigateToStartScreen(BuildContext context) async {
    await UserController().signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
          (route) => false,
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

class CustomBottomBar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onSettingsPressed;
  final VoidCallback onProfilePressed;

  const CustomBottomBar({
    Key? key,
    required this.onHomePressed,
    required this.onSettingsPressed,
    required this.onProfilePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onHomePressed,
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
        ],
      ),
    );
  }
}
