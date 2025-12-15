import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<List<String>> onboardingImages = [
    [
      'assets/images/page1/on1_mid.png',
      'assets/images/page1/on1_bottom1.png',
    ],
    [
      'assets/images/page2/on2_md.png',
      'assets/images/page2/on2_bottom.png',
    ],
    [
      'assets/images/page3/on3_md.png',
      'assets/images/page3/on3_bottom.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 🔹 PageView
            PageView.builder(
              controller: _controller,
              itemCount: onboardingImages.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, pageIndex) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: onboardingImages[pageIndex]
                          .asMap()
                          .entries
                          .map((entry) {
                        int imgIndex = entry.key;
                        String imgPath = entry.value;

                        double imgHeight;

                        if (pageIndex == 0) {
                          imgHeight = screenHeight * (imgIndex == 0 ? 0.28 : 0.26);
                        } else if (pageIndex == 1) {
                          imgHeight = screenHeight * (imgIndex == 0 ? 0.25 : 0.23);
                        } else {
                          imgHeight = screenHeight * (imgIndex == 0 ? 0.26 : 0.24);
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Image.asset(
                            imgPath,
                            width: double.infinity,
                            height: imgHeight,
                            fit: BoxFit.contain,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),

            // 🔹 Top Row: Left = page indicator, Right = Skip
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${currentIndex + 1}/${onboardingImages.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Bottom Row: Prev + Dots + Next
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Prev button (only on page 2 & 3)
                  if (currentIndex != 0)
                    ElevatedButton(
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        minimumSize: const Size(80, 50),
                      ),
                      child: const Text('Prev'),
                    ),

                  if (currentIndex != 0) const SizedBox(width: 20),

                  // Dots
                  Row(
                    children: List.generate(
                      onboardingImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(4),
                        width: currentIndex == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.black
                              : const Color.fromARGB(190, 3, 3, 3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 60), // space between dots and Next

                  // Next / Get Started button
                  ElevatedButton(
                    onPressed: () {
                      if (currentIndex == onboardingImages.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      minimumSize: const Size(100, 50),
                    ),
                    child: Text(
                      currentIndex == onboardingImages.length - 1
                          ? 'Get Started'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
