import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newfitnessapp/cardio.dart';
import 'package:newfitnessapp/user_controller.dart';

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
    // Check user authentication status before accessing user data
    if (UserController.user == null) {
      // User not authenticated, handle accordingly
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 70),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(UserController.user?.photoURL ?? ''),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ${UserController.user?.displayName ?? ''}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formatDateAndTime(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EBEA),
                  borderRadius: BorderRadius.circular(10),
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
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'exercise',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/weightlifter.png',
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildClickableTextWithImage(
                          image: const AssetImage('assets/personalised_routine/personalised_routine_icon.png'),
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
                          image: const AssetImage('assets/reformer/reformer_icon.png'),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildClickableTextWithImage(
                          image: const AssetImage('assets/strength/strength_icon.png'),
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
                          image: const AssetImage('assets/stretching/stretching_icon.png'),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildClickableTextWithImage(
                          image: const AssetImage('assets/cardio/cardio.png'), // Specify the image for cardio
                          text: 'Cardio', // Specify the text for cardio
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CardioScreen(), // Redirect to CardioPage
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Add more widgets as needed
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 110, // Adjust the height as needed
        child: CustomBottomBar(),
      ), // Using the custom bottom bar
    );
  }

  String formatDateAndTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('EEEE, d MMMM y');
    final String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

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
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 20),
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
}

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
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
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
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
          ),
          Expanded(
            child: Column(
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