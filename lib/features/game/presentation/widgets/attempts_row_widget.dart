import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexi_quest/core/theme/app_colors.dart';
import 'package:lexi_quest/core/theme/extensions.dart';
import 'package:lexi_quest/features/game/presentation/bloc/game_bloc.dart';
import 'package:lexi_quest/features/game/presentation/widgets/letter_box_widget.dart';

class AttemptsRowWidget extends StatelessWidget {
  final int attemptIndex;

  const AttemptsRowWidget({super.key, required this.attemptIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final word = state.word ?? " ";
        final previousAttempts = state.attempts ?? [];
        final currentAttempt = state.currentAttempts ?? '';
        final isCurrentAttempt = attemptIndex == previousAttempts.length;
        return Row(
          children: List.generate(word.length, (letterIndex) {
            var text = _getLetter(
              letterIndex,
              attemptIndex,
              previousAttempts,
              currentAttempt,
              isCurrentAttempt,
            );

            var boxColor = _getBoxColor(
              context,
              text,
              word,
              attemptIndex,
              letterIndex,
              previousAttempts,
              isCurrentAttempt,
            );

            var textColor = _getTextColor(
              context,
              text,
              word,
              attemptIndex,
              letterIndex,
              previousAttempts,
              isCurrentAttempt,
            );

            return Expanded(
              child: LetterBoxWidget(
                text: text,
                boxColor: boxColor,
                textColor: textColor,
              ),
            );
          }),
        );
      },
    );
  }

  String _getLetter(
    int letterIndex,
    int attemptIndex,
    List<String> previousAttempts,
    String currentAttempts,
    bool isCurrentAttempt,
  ) {
    if (attemptIndex < previousAttempts.length) {
      return previousAttempts[attemptIndex][letterIndex];
    } else if (isCurrentAttempt) {
      return letterIndex < currentAttempts.length
          ? currentAttempts[letterIndex]
          : '';
    }
    return '';
  }

  Color? _getBoxColor(
    BuildContext context,
    String letter,
    String word,
    int attemptIndex,
    int letterIndex,
    List<String> previousAttempts,
    bool isCurrentAttempt,
  ) {
    if (attemptIndex >= previousAttempts.length ||
        letter.isEmpty ||
        isCurrentAttempt) {
      return null;
    } else if (word[letterIndex] == letter) {
      return AppColors.green;
    } else if (word.contains(letter)) {
      return AppColors.yellow;
    }
    return context.colorScheme.onSurfaceVariant;
  }

  Color? _getTextColor(
    BuildContext context,
    String letter,
    String word,
    int attemptIndex,
    int letterIndex,
    List<String> previousAttempts,
    bool isCurrentAttempt,
  ) {
    if (attemptIndex >= previousAttempts.length ||
        letter.isEmpty ||
        isCurrentAttempt) {
      return context.colorScheme.onSurface;
    } else if (word[letterIndex] == letter || word.contains(letter)) {
      return context.colorScheme.surface;
    }
    return context.colorScheme.onSurface;
  }
}
