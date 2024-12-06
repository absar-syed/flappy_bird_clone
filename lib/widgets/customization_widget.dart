import 'package:flappy_bird_clone/bloc/game/game_cubit.dart';
import 'package:flutter/material.dart';

class CustomizationScreen extends StatelessWidget {
  const CustomizationScreen({super.key, required this.gameCubit});
  final GameCubit gameCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Customization"),
            ElevatedButton(
                onPressed: () => gameCubit.restartGame(),
                child: const Text("Go Back"))
          ],
        ),
      ),
    );
  }
}
