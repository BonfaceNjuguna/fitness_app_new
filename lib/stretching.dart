import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'setting_page.dart';
import 'start_screen.dart';

class StretchingScreen extends StatefulWidget {
  const StretchingScreen({Key? key}) : super(key: key);

  @override
  State<StretchingScreen> createState() => _StretchingScreenState();
}

class _StretchingScreenState extends State<StretchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Stretching Screen'),
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
          _showProfileDialog(context);
        },
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
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void _showProfileDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onSettingsPressed,
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
                onPressed: onProfilePressed,
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
    );
  }
}
