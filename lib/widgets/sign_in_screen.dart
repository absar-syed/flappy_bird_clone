import 'package:flappy_bird_clone/bloc/game/game_cubit.dart';
import 'package:flappy_bird_clone/services/player_records.dart';
import 'package:flappy_bird_clone/services/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.gameCubit});
  final GameCubit gameCubit;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> attachAndSaveUsername(String username) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Update user profile with username
        await user.updateDisplayName(username);
        await user.reload();
        debugPrint("Username attached: ${user.displayName}");

        // Save player name to Firestore
        await savePlayerName(username);
        debugPrint("Player name saved to Firestore: $username");
      } catch (error) {
        debugPrint("Error saving username: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter a Username!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _usernameController,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = await signInAnonymously();
                if (user != null) {
                  // Attach username and save it to Firestore
                  await attachAndSaveUsername(_usernameController.text);

                  widget.gameCubit.restartGame();
                  debugPrint('User signed in successfully: ${user.uid}');
                }
              },
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
