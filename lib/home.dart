import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'user_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool continueWithGoogleClicked = false;
  bool continueWithAppleClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png'),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to Sarah Fitness',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Continue with:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Transform.translate(
              offset: Offset(0, -MediaQuery.of(context).size.height * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(
                    label: 'Google',
                    imageAssetPath: 'assets/google_logo.png',
                    onPressed: () async {
                      setState(() {
                        continueWithGoogleClicked = true;
                        continueWithAppleClicked = false;
                      });

                      try {
                        final user = await UserController.loginWithGoogle();

                        if (user != null && mounted) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const StartScreen()),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        print(e.message);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              e.message ?? "Something went wrong",
                            ),
                          ),
                        );
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              e.toString(),
                            ),
                          ),
                        );
                      }
                    },
                    clicked: continueWithGoogleClicked,
                  ),
                  const SizedBox(width: 10), // Add spacing between buttons
                  _buildButton(
                    label: 'Apple',
                    imageAssetPath: 'assets/apple_logo.png',
                    onPressed: () {
                      setState(() {
                        continueWithAppleClicked = true;
                        continueWithGoogleClicked = false;
                      });
                      // Perform your custom Apple sign-in logic here if needed
                    },
                    clicked: continueWithAppleClicked,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required String imageAssetPath,
    required VoidCallback onPressed,
    required bool clicked,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Set radius to 0 for sharp corners
            side: BorderSide(color: Colors.black), // Set black border
          ), backgroundColor: Colors.white,
          foregroundColor: Colors.white, // Set transparent background
        ),
        onPressed: clicked ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAssetPath,
              width: 30, // Set the width as needed
              height: 30, // Set the height as needed
            ),
            const SizedBox(width: 10), // Add some spacing between image and label
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black, // Set text color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
