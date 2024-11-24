import 'package:club_house_ui_2/screens/home_sreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Club House',
      theme: ThemeData(
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFF27AE61)),
          scaffoldBackgroundColor: const Color(0xFFF2F0E4),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF2F0E4)),
          iconTheme: const IconThemeData(color: Colors.black),
          textTheme: GoogleFonts.montserratTextTheme()),
      home: HomeScreen(),
    );
  }
}
