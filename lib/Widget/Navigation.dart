import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lifehero/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lifehero/View/ChallengeView.dart';
import 'package:lifehero/View/NutritionView.dart';
import 'package:lifehero/View/ProfileView.dart';
import 'package:lifehero/View/WorkoutView.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int currentWidget = 0;
  final PageController _pageController = PageController();

  void goToWidget(int index) {
    _pageController.jumpToPage(index);
    setState(() => currentWidget = index);
  }

  final List<Widget> _pages = const [
    Challengeview(),
    Workoutview(),
    Nutritionview(),
    Profileview()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: GNav(
                // rippleColor: Colors.grey[300]!,
                // hoverColor: Colors.green,
                gap: 8,
                activeColor: AppColors.primary,
                iconSize: 24,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                duration: const Duration(milliseconds: 200),
                tabBackgroundColor: AppColors.primary.withOpacity(0.1),
                color: Colors.grey[800],
                tabs: const [
                  GButton(
                    icon: LineIcons.running,
                    text: 'Квест',
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Заряд',
                  ),
                  GButton(
                    icon: LineIcons.fruitApple,
                    text: 'Питание',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Профиль',
                  ),
                ],
                selectedIndex: currentWidget,
                onTabChange: goToWidget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}