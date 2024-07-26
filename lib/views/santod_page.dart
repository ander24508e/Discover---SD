import 'package:app_turism/templates/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SantodPage extends StatelessWidget {
  const SantodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fourthColor,
      appBar: AppBar(
        backgroundColor: barColor,
        title: Text(
          'Tierrita Tsachila'.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Historia Santo Domingo'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('lib/imagenes/bandera-santo-domingo.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Descripcion:',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Santo Domingo de los Tsáchilas, ciudad fundada el 3 de mayo de 1861, se erige como un vibrante centro en la región occidental"
                    "de Ecuador. A lo largo de los años, ha experimentado un crecimiento constante, convirtiéndose en un núcleo vital para la provincia."
                    "La ciudad celebra una rica diversidad étnica, destacando la comunidad Tsáchila, cuya herencia ancestral se refleja en su arte y profundo respeto por la naturaleza."
                    "\n\nHoy en día, Santo Domingo fusiona la modernidad con sus auténticas raíces, creando una experiencia única que refleja la identidad"
                    "única de esta tierra ecuatoriana. Con tradiciones arraigadas y una creciente vitalidad, la ciudad se presenta como un testimonio de la fusión armoniosa entre el pasado y el presente.",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
