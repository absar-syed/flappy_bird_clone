import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_bird_clone/bloc/game/game_cubit.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.gameCubit});
  final GameCubit gameCubit;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      debugPrint("User signed out successfully!");
      // Navigate to the sign-in screen or update the UI as needed
      Navigator.of(context).pushReplacementNamed('/sign-in'); // Adjust this as per your navigation setup
    } catch (error) {
      debugPrint("Error signing out: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 70, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () => widget.gameCubit.restartGame(),
              child: const Text("Go Back"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: signOut,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
