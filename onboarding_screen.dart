import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              OnboardingPage(
                image: 'assets/onboarding1.png',
                title: 'Welcome to ShopApp',
                subtitle: 'Find your favorite products easily!',
              ),
              OnboardingPage(
                image: 'assets/onboarding2.png',
                title: 'Best Deals',
                subtitle: 'Get amazing offers every day!',
              ),
              OnboardingPage(
                image: 'assets/onboarding3.png',
                title: 'Fast Delivery',
                subtitle: 'Receive your orders quickly at home!',
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Colors.deepPurple,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.animateToPage(
                      2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
