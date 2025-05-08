import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:lifehero/colors.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({super.key});

  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  late ValueNotifier<double> runValueNotifier;
  late ValueNotifier<double> pushValueNotifier;
  late ValueNotifier<double> twistingValueNotifier;
  late ValueNotifier<double> squatValueNotifier;

  late int runCount = 0;
  late int pushCount = 0;
  late int twistingCount = 0;
  late int squatCount = 0;

  @override
  void initState() {
    super.initState();
    runValueNotifier = ValueNotifier(0.0);
    pushValueNotifier = ValueNotifier(0.0);
    twistingValueNotifier = ValueNotifier(0.0);
    squatValueNotifier = ValueNotifier(0.0);
  }

  @override
  void dispose() {
    runValueNotifier.dispose();
    pushValueNotifier.dispose();
    twistingValueNotifier.dispose();
    squatValueNotifier.dispose();
    super.dispose();
  }

  Widget buildExerciseCard({
    required String label,
    required IconData icon,
    required int count,
    required int step,
    required ValueNotifier<double> notifier,
    required Color color,
    required Function(int) onChanged,
  }) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cardLight, AppColors.borderLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: AppColors.darkText, fontWeight: FontWeight.w500)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CartStepperInt(
              alwaysExpanded: true,
              stepper: step,
              count: count,
              size: 30,
              style: CartStepperTheme.of(context).copyWith(
                activeForegroundColor: AppColors.white,
                activeBackgroundColor: color,
              ),
              didChangeCount: (count) {
                setState(() {
                  onChanged(count);
                  notifier.value = count.toDouble();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            const SizedBox(height: 30),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SimpleCircularProgressBar(
                  size: 200,
                  startAngle: 0,
                  animationDuration: 3,
                  maxValue: 10,
                  valueNotifier: runValueNotifier,
                  progressStrokeWidth: 14,
                  backStrokeWidth: 14,
                  mergeMode: true,
                  progressColors: const [AppColors.primary],
                  backColor: AppColors.primary.withOpacity(0.2),
                ),
                SimpleCircularProgressBar(
                  size: 150,
                  maxValue: 100,
                  animationDuration: 3,
                  valueNotifier: pushValueNotifier,
                  progressStrokeWidth: 14,
                  backStrokeWidth: 14,
                  mergeMode: true,
                  progressColors: const [AppColors.secondary],
                  backColor: AppColors.secondary.withOpacity(0.2),
                ),
                SimpleCircularProgressBar(
                  size: 100,
                  maxValue: 100,
                  animationDuration: 3,
                  valueNotifier: twistingValueNotifier,
                  progressStrokeWidth: 14,
                  backStrokeWidth: 14,
                  mergeMode: true,
                  progressColors: const [AppColors.lightAccent],
                  backColor: AppColors.lightAccent.withOpacity(0.2),
                ),
                SimpleCircularProgressBar(
                  size: 50,
                  maxValue: 100,
                  animationDuration: 3,
                  valueNotifier: squatValueNotifier,
                  progressStrokeWidth: 14,
                  backStrokeWidth: 14,
                  mergeMode: true,
                  progressColors: const [Color(0xFF6C5CE7)],
                  backColor: const Color(0xFF6C5CE7).withOpacity(0.2),
                ),
              ],
            ),
            const SizedBox(height: 50),
            buildExerciseCard(
              label: "Бег",
              icon: Icons.directions_run,
              count: runCount,
              step: 1,
              notifier: runValueNotifier,
              color: AppColors.primary,
              onChanged: (val) => runCount = val,
            ),
            const SizedBox(height: 20),
            buildExerciseCard(
              label: "Отжимания",
              icon: Icons.fitness_center,
              count: pushCount,
              step: 10,
              notifier: pushValueNotifier,
              color: AppColors.secondary,
              onChanged: (val) => pushCount = val,
            ),
            const SizedBox(height: 20),
            buildExerciseCard(
              label: "Скручивания",
              icon: Icons.accessibility_new,
              count: twistingCount,
              step: 10,
              notifier: twistingValueNotifier,
              color: AppColors.lightAccent,
              onChanged: (val) => twistingCount = val,
            ),
            const SizedBox(height: 20),
            buildExerciseCard(
              label: "Приседания",
              icon: Icons.directions_walk,
              count: squatCount,
              step: 10,
              notifier: squatValueNotifier,
              color: const Color(0xFF7F74D9),
              onChanged: (val) => squatCount = val,
            ),
          ],
        ),
      ),
    );
  }
}
