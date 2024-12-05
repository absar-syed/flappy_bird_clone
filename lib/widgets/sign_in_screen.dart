import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_bird_clone/bloc/game/game_cubit.dart';
import 'package:flappy_bird_clone/models/player.dart';
import 'package:flappy_bird_clone/services/sign_in.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
    required this.gameCubit,
  });
  final GameCubit gameCubit;
  // late  Future<User?> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Enter a Username!",
          textAlign: TextAlign.center,
        ),
        TextField(autofocus: true),
        ElevatedButton(
            onPressed: () async {
              await signInAnonymously();
              gameCubit.restartGame();
            },
            child: Text("Sign In"))
      ],
    )));
  }
}
