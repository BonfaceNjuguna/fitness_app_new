import 'package:flutter/material.dart';

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
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomBarItem(
            onPressed: onHomePressed,
            icon: Icons.home,
            color: Colors.orange,
            label: 'Home',
          ),
          _buildBottomBarItem(
            onPressed: onSettingsPressed,
            icon: Icons.settings,
            color: Colors.black,
            label: 'Settings',
          ),
          _buildBottomBarItem(
            onPressed: onProfilePressed,
            icon: Icons.person,
            color: Colors.black,
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBarItem({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }
}
