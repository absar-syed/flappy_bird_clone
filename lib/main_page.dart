import 'package:flame/game.dart';
import 'package:flappy_bird_clone/bloc/game/game_cubit.dart';
import 'package:flappy_bird_clone/flappy_bird_clone_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyBirdCloneGame _flappyBirdCloneGame;
  late GameCubit gameCubit;
  PlayingState? _latestState;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    _flappyBirdCloneGame = FlappyBirdCloneGame(gameCubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(listener: (context, state) {
      if (state.currentPlayingState == PlayingState.none &&
          _latestState == PlayingState.gameOver) {
        setState(() {
          _flappyBirdCloneGame = FlappyBirdCloneGame(gameCubit);
        });
      }
      _latestState = state.currentPlayingState;
    }, builder: (context, state) {
      return Scaffold(
          body: Stack(
        children: [
          GameWidget(game: _flappyBirdCloneGame),
          if (state.currentPlayingState ==
              PlayingState.gameOver) // Game over Screen
            Container(
              color: Colors.black38,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'GAME OVER',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  ElevatedButton(
                      onPressed: () => gameCubit.restartGame(),
                      child: const Text('Play Again!'))
                ],
              )),
            )
        ],
      ));
    });
  }
}
