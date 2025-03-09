import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexi_quest/core/theme/extensions.dart';
import '../bloc/game_bloc.dart';

class GameKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;
  final Function() onDelete;
  final Function() onSubmit;

  const GameKeyboard({
    super.key,
    required this.onKeyPressed,
    required this.onDelete,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    const rows = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBNM'];
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...rows.map((map) => _buildKeyBoardRow(context, state, map)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildKeyBoardRow(BuildContext context, GameState state, String row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          row.split('').map((key) => _buildKey(context, state, key)).toList(),
    );
  }

  Widget _buildKey(BuildContext context, GameState state, String key) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: .8,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => onKeyPressed(key),
            child: Text(
              key,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
