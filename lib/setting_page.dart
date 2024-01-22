import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';

import 'profile_page.dart';
import 'start_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('Common'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  value: const Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {
                    themeNotifier.toggleDarkMode(value);
                  },
                  initialValue: themeNotifier.isDarkModeEnabled,
                  leading: const Icon(Icons.format_paint),
                  title: const Text('Dark Mode'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onHomePressed: () {
          _showStartScreen(context);
        },
        onSettingsPressed: () {
          // Do nothing, as you are already on the settings page
        },
        onProfilePressed: () {
          _showProfilePage(context);
        },
      ),
    );
  }

  void _showProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onSettingsPressed,
                icon: const Icon(
                  Icons.settings,
                  color: Colors.orange,
                ),
              ),
              const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.orange,
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

class ThemeNotifier with ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void toggleDarkMode(bool value) {
    _isDarkModeEnabled = value;
    notifyListeners();
  }
}
