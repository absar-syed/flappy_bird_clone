import 'package:flappy_bird_clone/bloc/game/game_cubit.dart';
import 'package:flutter/material.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({super.key, required this.gameCubit});
  final GameCubit gameCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
