import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:lifehero/colors.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Challengeview extends StatefulWidget {
  const Challengeview({super.key});

  @override
  State<Challengeview> createState() => _ChallengeviewState();
}

class _ChallengeviewState extends State<Challengeview> {


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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children:[
                        SimpleCircularProgressBar(
                        size: 200,
                        startAngle: 0,
                        animationDuration: 3,
                        maxValue: 10,
                        valueNotifier: runValueNotifier,
                        progressStrokeWidth: 14,
                        backStrokeWidth: 14,
                        mergeMode: true,
                        progressColors: const [AppColors.primary, AppColors.secondary],
                        backColor: AppColors.primary.withOpacity(0.4)),
                        SimpleCircularProgressBar(
                            size: 150,
                            maxValue: 100,
                            animationDuration: 3,
                            valueNotifier: pushValueNotifier,
                            progressStrokeWidth: 14,
                            backStrokeWidth: 14,
                            mergeMode: true,
                            progressColors: const [AppColors.primary, AppColors.secondary],
                            backColor: AppColors.primary.withOpacity(0.4)),
                        SimpleCircularProgressBar(
                            size: 100,
                            maxValue: 100,
                            animationDuration: 3,
                            valueNotifier: twistingValueNotifier,
                            progressStrokeWidth: 14,
                            backStrokeWidth: 14,
                            mergeMode: true,
                            progressColors: const [AppColors.primary, AppColors.secondary],
                            backColor: AppColors.primary.withOpacity(0.4)),
                        SimpleCircularProgressBar(
                            size: 50,
                            maxValue: 100,
                            animationDuration: 3,
                            valueNotifier: squatValueNotifier,
                            progressStrokeWidth: 14,
                            backStrokeWidth: 14,
                            mergeMode: true,
                            progressColors: const [AppColors.primary, AppColors.secondary],
                            backColor: AppColors.primary.withOpacity(0.4)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.cardLight,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Бег"),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CartStepperInt(
                        alwaysExpanded: true,
                        stepper: 1,
                        count: runCount,
                        size: 30,
                        style: CartStepperTheme.of(context).copyWith(
                          activeForegroundColor: AppColors.white,
                          activeBackgroundColor: AppColors.primary
                        ),
                        didChangeCount: (count) {
                          setState(() {
                            runCount = count;
                            runValueNotifier.value = runCount as double;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.cardLight,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Отжимания"),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CartStepperInt(
                        stepper: 10,
                        count: pushCount,
                        alwaysExpanded: true,
                        size: 30,
                        style: CartStepperTheme.of(context).copyWith(
                            activeForegroundColor: AppColors.white,
                            activeBackgroundColor: AppColors.primary
                        ),
                        didChangeCount: (count) {
                          setState(() {
                            pushCount = count;
                            pushValueNotifier.value = pushCount as double;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.cardLight,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Скручивания"),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CartStepperInt(
                        alwaysExpanded: true,
                        stepper: 10,
                        count: twistingCount,
                        size: 30,
                        style: CartStepperTheme.of(context).copyWith(
                            activeForegroundColor: AppColors.white,
                            activeBackgroundColor: AppColors.primary
                        ),
                        didChangeCount: (count) {
                          setState(() {
                            twistingCount = count;
                            twistingValueNotifier.value = twistingCount as double;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.cardLight,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Бег"),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CartStepperInt(
                        alwaysExpanded: true,
                        stepper: 10,
                        count: squatCount,
                        size: 30,
                        style: CartStepperTheme.of(context).copyWith(
                            activeForegroundColor: AppColors.white,
                            activeBackgroundColor: AppColors.primary
                        ),
                        didChangeCount: (count) {
                          setState(() {
                            squatCount = count;
                            squatValueNotifier.value = squatCount as double;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    runValueNotifier.dispose();
    pushValueNotifier.dispose();
    twistingValueNotifier.dispose();
    squatValueNotifier.dispose();
    super.dispose();
  }
}