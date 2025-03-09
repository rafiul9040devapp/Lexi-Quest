import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexi_quest/features/game/presentation/widgets/attempts_row_widget.dart';
import '../bloc/game_bloc.dart';

class AttemptsWidget extends StatelessWidget {
  const AttemptsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return AttemptsRowWidget(attemptIndex: index);
              },
              separatorBuilder: (context, index) {
                return  SizedBox(
                  height: 10,
                );
              },
               itemCount:  state.attemptsCount ?? 0,
              shrinkWrap: true,
            ),
          ),
        );
      },
    );
  }
}
