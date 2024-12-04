// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState());

  void startPlaying() {
    emit(state.copyWith(
        currentPlayingState: PlayingState.playing, currentCoins: 0));
  }

  void gameOver() {
    emit(state.copyWith(currentPlayingState: PlayingState.gameOver));
  }

  void increaseCoins() {
    emit(state.copyWith(
      currentCoins: state.currentCoins + 1,
    ));
  }

  restartGame() {
    emit(state.copyWith(
        currentPlayingState: PlayingState.none, currentCoins: 0));
  }
}
