import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {

    on<StartGameEvent>(onStartGameEvent);
  }

  FutureOr<void> onStartGameEvent(StartGameEvent event, Emitter<GameState> emit) async {
    emit(state.copyWith(
      status: GameStatus.inProgress,
      word: 'TEST',
      attemptsCount: event.attemptsCount
    ));

  }
}
