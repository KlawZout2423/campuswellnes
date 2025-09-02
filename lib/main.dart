import 'package:flutter/material.dart';
import 'screens/reason_page.dart';
import 'screens/onboarding_page.dart';
import 'screens/get_started_page.dart';
import 'screens/question_page.dart';
import 'screens/mood_log_page.dart'; // <-- import MoodLogPage

void main() {
  runApp(const CampusWellnessApp());
}

class CampusWellnessApp extends StatelessWidget {
  const CampusWellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Wellness',
      theme: ThemeData(
        primaryColor: const Color(0xFF56AB2F),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF56AB2F),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          iconTheme: IconThemeData(color: Color(0xFF56AB2F)),
        ),
      ),
      home: const ReasonPage(), // start here
      routes: {
        '/reason': (context) => const ReasonPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/getStarted': (context) => const GetStartedPage(),
        '/questions': (context) => const QuestionPage(),
        '/moodLog': (context) => const MoodLogPage(),
      },
    );
  }
}
