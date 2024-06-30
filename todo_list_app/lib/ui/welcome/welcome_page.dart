import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class WelcomePage extends StatelessWidget {

  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        leading: TextButton(
          onPressed: canPop ? () {
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
          } : null,
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildContent(),
            const Spacer(),
            _buildLoginButton(context),
            _buildAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 58),
      child:  Center(
        child: Text(
          'welcome_title'.tr(),
          style: const TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 80).copyWith(top: 26),
      child: Text(
        "welcome_content".tr(),
        style: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.67),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          final currentLocale = context.locale.toString();
          if(currentLocale == "en"){
            context.setLocale(const Locale("vi"));
          }else{
            context.setLocale(const Locale("en"));
          }

        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff8875FF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        child: const Text(
          'LOGIN',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildAccountButton() {
    return Container(
      width: 327,
      height: 48,
      margin:const EdgeInsets.only(top: 40,bottom: 67),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
        ),
        child: const Text(
          'Create account',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
