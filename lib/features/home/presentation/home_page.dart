import 'package:flutter/material.dart';
import 'package:lexi_quest/core/theme/extensions.dart';
import 'package:lexi_quest/features/home/widgets/slider_selection_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double wordLength = 4;
  double attemptsCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guess It',
                style: context.textTheme.headlineLarge?.copyWith(
                    letterSpacing: 2, color: context.colorScheme.primary),
              ),
              SizedBox(height: 10),
              Text(
                'By DevVibe Youtube',
                style: context.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: 2),
              ),
              SizedBox(height: 16),
              Text(
                'Choose your game settings',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 32),
              SliderSelectionWidget(
                title: 'Word Length',
                value: wordLength,
                minValue: 4,
                maxValue: 7,
                divisions: 3,
                onChanged: (value) {
                  setState(() {
                    wordLength = value;
                  });
                },
              ),
              SizedBox(height: 32),
              SliderSelectionWidget(
                title: 'Attempts Count',
                value: attemptsCount,
                minValue: 3,
                maxValue: 7,
                divisions: 4,
                onChanged: (value) {
                  setState(() {
                    attemptsCount = value;
                  });
                },
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: context.colorScheme.primary,
                    foregroundColor: context.colorScheme.surface,
                    elevation: 5,
                    shadowColor: Colors.blue.withOpacity(.3)
                  ),
                  child: Text(
                    'Start Game',
                    style: context.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
