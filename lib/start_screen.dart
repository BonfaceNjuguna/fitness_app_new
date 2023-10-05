import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'personalised_routine.dart';
import 'profile_page.dart';
import 'reformer.dart';
import 'setting_page.dart';
import 'strength.dart';
import 'stretching.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 70),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile_image.jpeg'),
                    ),
                    const SizedBox(width: 30), // Add space between the profile image and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello Isaya!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10), // Add some space between the text widgets
                        Text(
                          formatDateAndTime(DateTime.now()), // Format and display custom date and time
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30), // Add space below the existing content
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EBEA), // Use color #E8EBEA for the background
                    borderRadius: BorderRadius.circular(10), // Rounded border radius
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Refresh body with',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black, // Black text color
                              ),
                            ),
                            Text(
                              'exercise',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black, // Black text color
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20), // Add space between the text and image
                      Image.asset(
                        'assets/weightlifter.png', // Replace with your image path
                        width: 150, // Adjust image width as needed
                        height: 150, // Adjust image height as needed
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20), // Add left padding to "Categories" text
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Add vertical spacing
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Add spacing between columns
                        children: [
                          buildClickableTextWithImage(
                            image: const AssetImage('assets/personalised_routine/personalised_routine_icon.png'), // Replace with your image asset
                            text: 'Personalised\n     Routine',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PersonalisedRoutineScreen(),
                                ),
                              );
                            },
                          ),
                          buildClickableTextWithImage(
                            image: const AssetImage('assets/reformer/reformer_icon.png'), // Replace with your image asset
                            text: 'Reformer\n  ',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ReformerScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Add vertical spacing
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Add spacing between columns
                        children: [
                          buildClickableTextWithImage(
                            image: const AssetImage('assets/strength/strength_icon.png'), // Replace with your image asset
                            text: 'Strength',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StrengthScreen(),
                                ),
                              );
                            },
                          ),
                          buildClickableTextWithImage(
                            image: const AssetImage('assets/stretching/stretching_icon.png'), // Replace with your image asset
                            text: 'Stretching',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StretchingScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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

                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.orange,
                  ),
                ),
                const Text(
                  'Home',
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

  String formatDateAndTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('EEEE, d MMMM y');
    final String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  // Function to build clickable text with an image
  Widget buildClickableTextWithImage({
    required AssetImage image,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image(
            image: image,
            width: 80, // Adjust image width as needed
            height: 80, // Adjust image height as needed
          ),
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