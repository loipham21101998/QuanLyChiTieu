import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/category/create_or_edit_category.dart';
import 'package:todo_list_app/ui/main/main_page.dart';
import 'package:todo_list_app/ui/onboarding/onboarding_page_view.dart';
import 'package:todo_list_app/ui/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/ui/welcome/welcome_page.dart';
import 'package:easy_localization/easy_localization.dart';

void main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale("vi"),Locale("en")],
      path: 'assets/translations',
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      home: const CreateOrEditCategory(),
      debugShowCheckedModeBanner: false,
    );


  }
}

