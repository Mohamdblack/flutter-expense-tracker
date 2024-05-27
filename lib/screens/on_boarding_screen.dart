import 'package:expense_trucker/screens/sign_in_screen.dart';
import 'package:expense_trucker/widgets/onBoardingCard.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final List<Widget> onBoardingPages = [
      OnboardingCard(
        image: "assets/onboarding_1.jpg",
        title: 'Always take control\nof your finance',
        description:
            'Finance must be arranged to set a better \nlifestyle in the future',
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            1,
            duration: Durations.long1,
            curve: Curves.linear,
          );
        },
      ),
      OnboardingCard(
        image: "assets/onboarding_2.jpg",
        title: 'Track Your Expenses\nEffortlessly',
        description:
            'Keep an eye on your spending to \nmake informed financial decisions',
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            2,
            duration: Durations.long1,
            curve: Curves.linear,
          );
        },
      ),
      OnboardingCard(
        image: "assets/onboarding_3.jpg",
        title: 'Achieve Your Financial Goals',
        description:
            'Set and reach your financial \nobjectives with ease and confidence.',
        buttonText: 'Done',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const LoginPage(),
            ),
          );
        },
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: onBoardingPages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: onBoardingPages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: const Color(0xff1a936f),
                dotColor: Theme.of(context).colorScheme.secondary,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Durations.long1,
                  curve: Curves.linear,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
