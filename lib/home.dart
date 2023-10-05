import 'package:flutter/material.dart';

import 'get_started.dart';
import 'log_in.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool logInButtonClicked = false;
  bool signUpButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png'),
              const SizedBox(height: 20),
              _buildTextButton(
                label: 'Are you a member? Log In',
                onPressed: () {
                  setState(() {
                    logInButtonClicked = true;
                    signUpButtonClicked = false;
                  });
                  // Perform your custom login logic here if needed
                  // For now, let's just navigate to the StartScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogInScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: _buildButton(
                  label: 'Get Started',
                  onPressed: () {
                    setState(() {
                      signUpButtonClicked = true;
                      logInButtonClicked = false;
                    });
                    // Perform your custom sign up logic here if needed
                    // For now, let's just navigate to the StartScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GetStartedScreen()),
                    );
                  },
                  clicked: signUpButtonClicked,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
    required bool clicked,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Set radius to 0 for sharp corners
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          side: const BorderSide(color: Colors.black),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Text(
              '>',
              style: TextStyle(
                fontSize: 30, // You can adjust the font size as needed
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 2)),
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
