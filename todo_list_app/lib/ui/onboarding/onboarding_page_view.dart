//class cha : quan ly cac page con. di chuyen qua lai giua cac page con
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/welcome/welcome_page.dart';
import 'package:todo_list_app/ultils/enums/onboarding_page_position.dart';

import 'onboarding_child_page.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller:  _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
           OnboardingChildPage(onboardingPagePosition: OnboardingPagePosition.page1,nextOnPressed: (){_pageController.jumpToPage(1);},backOnPressed: (){print('First');},skipOnPressed: (){_narkOnboardingCompleted();_goToWelcome();},),
           OnboardingChildPage(onboardingPagePosition: OnboardingPagePosition.page2,nextOnPressed: (){_pageController.jumpToPage(2);},backOnPressed: (){_pageController.jumpToPage(0);},skipOnPressed: (){_narkOnboardingCompleted();_goToWelcome();},),
           OnboardingChildPage(onboardingPagePosition: OnboardingPagePosition.page3,nextOnPressed: (){_narkOnboardingCompleted();_goToWelcome();},backOnPressed: (){_pageController.jumpToPage(1);},skipOnPressed: (){_narkOnboardingCompleted();_goToWelcome();},),

        ],
      ),
    );
  }

  void _goToWelcome(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const WelcomePage()));
  }

  Future<void> _narkOnboardingCompleted() async{
    try {
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('kOnboardingCompleted', true);
    } catch (e) {
      return ;
    }
  }
}
