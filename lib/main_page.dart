import 'package:flame/game.dart';
import 'package:flappy_bird_clone/flappy_bird_clone_game.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyBirdCloneGame _flappyBirdCloneGame;
  @override
  void initState() {
    _flappyBirdCloneGame = FlappyBirdCloneGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: _flappyBirdCloneGame,
      ),
    );
  }
}
