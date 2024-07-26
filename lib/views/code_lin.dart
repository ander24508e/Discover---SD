import 'package:app_turism/templates/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CodeLin extends StatelessWidget {
  const CodeLin({super.key});

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
                    'code-tech'.toUpperCase(),
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
                  Text(
                    'Agradecimiento:',
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
                    "Agradecemos sinceramente su visita a la encantadora ciudad de Santo Domingo, un lugar lleno de historia,"
                    " diversidad cultural y belleza natural. Nos complace que hayas elegido explorar las maravillas que ofrece nuestra ciudad."
                    "\n\nAdemás, queremos destacar una emocionante oportunidad para aquellos que deseen dar visibilidad a sus servicios o negocios"
                    "locales. A través de nuestro código QR exclusivo, les invitamos a ponerse en contacto con Code Tech para explorar la"
                    "posibilidad de promocionar sus productos o servicios en nuestra aplicación. Estamos comprometidos en fortalecer la conexión entre"
                    "la comunidad y los emprendedores locales. ¡Esperamos con entusiasmo la posibilidad de colaborar y crecer juntos!",
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launchUrlString(
                          'https://chat.whatsapp.com/IBt9t8IZmfXC5E3PhpQXLA');
                    },
                    child: Text('WHATSAPP'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
