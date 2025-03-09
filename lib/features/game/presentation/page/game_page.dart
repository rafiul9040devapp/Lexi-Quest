import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexi_quest/core/get_it/get_it.dart';
import 'package:lexi_quest/core/theme/extensions.dart';
import 'package:lexi_quest/features/game/presentation/widgets/attempts_widget.dart';
import 'package:lexi_quest/features/game/presentation/widgets/game_keyboard.dart';

import '../bloc/game_bloc.dart';

class GamePage extends StatelessWidget {
  final int wordLength;
  final int attemptsCount;

  const GamePage(
      {super.key, required this.wordLength, required this.attemptsCount});

  static String route({required int wordLength, required int attemptsCount}) =>
      Uri(path: '/game', queryParameters: {
        'wordLength': wordLength.toString(),
        'attemptsCount': attemptsCount.toString(),
      }).toString();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GameBloc>()
        ..add(StartGameEvent(
            attemptsCount: attemptsCount, wordLength: wordLength)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Game',
            style: context.textTheme.headlineMedium,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            AttemptsWidget(),
            Spacer(),
            GameKeyboard(
              onKeyPressed: (String) {},
              onDelete: () {},
              onSubmit: () {},
            ),
          ],
        ),
      ),
    );
  }
}
