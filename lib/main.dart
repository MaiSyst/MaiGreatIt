import 'package:flutter/material.dart';
import './presentations/home/home_ui.dart';

void main() {
  runApp(const Mai());
}

class Mai extends StatelessWidget {
  const Mai({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreatIt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        fontFamily: "Roboto",
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.deepOrangeAccent.withAlpha(100))
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const MaterialStatePropertyAll(Colors.deepOrangeAccent),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          )
        ),
        indicatorColor: Colors.deepOrangeAccent
      ),
      home: const Home(),
    );
  }
}

