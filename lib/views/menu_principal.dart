import 'package:app_turism/templates/button.dart';
import 'package:app_turism/templates/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fourthColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10.0),
            Text(
              "CODE-TECH",
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.black,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                'lib/imagenes/santodomingo.jpeg',
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "¡¡ B I E N V E N I D O !!".toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " tierrita Tsachila ".toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            MyButton1(
                text: 'Explorar'.toUpperCase(),
                onTap: () {
                  Navigator.pushNamed(context, 'menu_page');
                })
          ],
        ),
      ),
    );
  }
}
