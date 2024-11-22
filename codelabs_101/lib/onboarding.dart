import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login.dart'; // Menuju halaman login

class OnboardingPage extends StatelessWidget {
  final String lottieAsset;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.lottieAsset,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(top: 50), // Tambah padding atas
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Memulai tata letak dari atas
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(flex: 2), // Ruang atas agar lebih turun
          Lottie.asset(
            lottieAsset,
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30), // Jarak animasi ke teks
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3), // Ruang bawah agar tombol tetap di tempat
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to MACHE',
      'description': 'The best rice meals from Makassar!',
      'lottie': 'assets/animation1.json',
    },
    {
      'title': 'Affordable Prices',
      'description': 'Only 15k for all menus!',
      'lottie': 'assets/animation2.json',
    },
    {
      'title': 'Order Now!',
      'description': 'Taste the goodness today.',
      'lottie': 'assets/animation3.json',
    },
  ];

  int _currentIndex = 0;

  void _onNext() {
    if (_currentIndex == onboardingData.length - 1) {
      _finishOnboarding();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: onboardingData[index]['title']!,
                description: onboardingData[index]['description']!,
                lottieAsset: onboardingData[index]['lottie']!,
              );
            },
          ),
          Positioned(
            bottom: 90, // Dot dan tombol sedikit naik
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => _buildDot(index),
                  ),
                ),
                const SizedBox(height: 20),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Skip Button
                    ElevatedButton(
                      onPressed: _finishOnboarding,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16), // Space antara tombol
                    // Next Button
                    ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 12,
      width: _currentIndex == index ? 20 : 12,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.greenAccent : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
