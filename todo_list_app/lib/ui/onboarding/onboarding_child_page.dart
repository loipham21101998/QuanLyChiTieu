//giao dien nam hinh

import 'package:flutter/material.dart';
import 'package:todo_list_app/ultils/enums/onboarding_page_position.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;
  final VoidCallback skipOnPressed;

  const OnboardingChildPage({
    super.key,
    required this.onboardingPagePosition ,
    required this.nextOnPressed,
    required this.backOnPressed,
    required this.skipOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSkipButton(),
                _buildOnboardingImage(),
                _buildOnboardingPageControl(),
                _buildOnboardingTitleContent(),
                _buildOnboardingNextAndPrevButton(),
              ]),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {skipOnPressed();},
        child: Text('SKIP',
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Lato",
                color: Colors.white.withOpacity(0.44))),
      ),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(onboardingPagePosition.onboardingPageImage(),
        height: 296, width: 271, fit: BoxFit.contain);
  }

  Widget _buildOnboardingPageControl() {
    return Container(
      margin: const EdgeInsets.only(top: 52, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page1
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(56)),
          ),
          Container(
            height: 4,
            width: 26,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page2
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(56)
            ),
          ),
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page3
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(56)
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            onboardingPagePosition.onboardingPageTitle(),
            style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontFamily: 'Lato',
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 42),
          Text(
            onboardingPagePosition.onboardingPageContent(),
            style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontFamily: 'Lato',
                fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildOnboardingNextAndPrevButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 200) ,
      child: Row(
        children: [
          TextButton(
            onPressed: () {backOnPressed();},
            child: Text('BACK',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Lato",
                    color: Colors.white.withOpacity(0.44))),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                //nextOnPressed.call();
                nextOnPressed();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8875FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: Text(onboardingPagePosition == OnboardingPagePosition.page3 ? 'Get Started' :'NEXT',
                  style: const TextStyle(
                      fontSize: 16, fontFamily: "Lato", color: Colors.white)))
        ],
      ),
    );
  }
}
