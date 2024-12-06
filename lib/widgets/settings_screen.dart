import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird_clone/bloc/game/game_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.gameCubit});
  final GameCubit gameCubit;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? playerName;

  @override
  void initState() {
    super.initState();
    _fetchPlayerName();
  }

  Future<void> _fetchPlayerName() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        playerName = user.displayName ?? "Anonymous";
      });
    } else {
      setState(() {
        playerName = "Guest";
      });
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
            const SizedBox(height: 20),
            Text(
              "Player Name: ${playerName ?? "Loading..."}",
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => widget.gameCubit.restartGame(),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
