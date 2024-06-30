import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/ui/onboarding/onboarding_page_view.dart';
import 'package:todo_list_app/ui/welcome/welcome_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _checkAppState(BuildContext context) async {
    //check kOnboardingComoleted
    if (!context.mounted) {
      return;
    }
    if (await _isOnboardingCompleted()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const WelcomePage()
          )
      );

    }
    else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingPageView()));
    }
  }

  Future<bool> _isOnboardingCompleted() async {
    try {
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool('kOnboardingCompleted');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAppState(context);

    return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SafeArea(child: _buildBodyWidget()));
  }

  Widget _buildBodyWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImageLogo(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildImageLogo() {
    return Image.asset(
      "assets/images/Group151.png",
      width: 95,
      height: 80,
      fit: BoxFit.contain,
    );
  }

  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        'UpToDo',
        style: TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
