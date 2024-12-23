import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 20)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrangeAccent,
          primary: Colors.black,
        ),
        fontFamily: GoogleFonts.ptSans().fontFamily,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(),
      home: Splash_Screen(),
    );
  }
}
