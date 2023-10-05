import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';

import 'profile_page.dart';
import 'start_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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

                  },
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
                  onPressed: () {
                    _showProfilePage(context);
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


class ThemeNotifier with ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void toggleDarkMode(bool value) {
    _isDarkModeEnabled = value;
    notifyListeners();
  }
}
