import 'package:flutter/material.dart';

import 'log_in.dart';
import 'start_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0), // Add padding for left alignment and top padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back when the arrow is clicked
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Join our community'.toUpperCase(), // Make text uppercase
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign up with one of the following options.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 140), // Add padding between text and buttons
            _buildButton(
              context: context,
              label: 'Google',
              imageAssetPath: 'assets/google_logo.png', // Replace with your asset path
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartScreen()),
                );
              },
            ),
            const SizedBox(height: 10),
            _buildButton(
              context: context,
              label: 'Apple',
              imageAssetPath: 'assets/apple_logo.png', // Replace with your asset path
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartScreen()),
                );
              },
            ),
            const SizedBox(height: 40), // Add padding between buttons and the text below
            _buildTextButton(
              label: "Are you a member? Log In",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required String imageAssetPath,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 70, // Increase button height by 30
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Set no border radius
            side: BorderSide(color: Colors.black), // Add a black border
          ),
          foregroundColor: Colors.black, // Set text color to black
          backgroundColor: Colors.white, // White background
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAssetPath,
              width: 30, // Adjust the width as needed
              height: 30, // Adjust the height as needed
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTextButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const Icon(Icons.arrow_forward, size: 18),
              ],
            ),
            Container(
              width: label.length * 10.0, // Adjust the multiplier as needed
              height: 2,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
