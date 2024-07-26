import 'package:app_turism/templates/color.dart';
import 'package:app_turism/controllers/lugares.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class navigateLocations extends StatefulWidget {
  final Lugar park;
  const navigateLocations({Key? key, required this.park}) : super(key: key);

  @override
  State<navigateLocations> createState() => _navigateLocationsState();
}

class ParquePage extends StatelessWidget {
  final Lugar park;

  const ParquePage({Key? key, required this.park}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(park.name),
      ),
      body: Center(
        child: Text('Detalles del lugar: ${park.name}'),
      ),
    );
  }
}

class _navigateLocationsState extends State<navigateLocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Text(
                    widget.park.name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    widget.park.imagePathing,
                    height: 300,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.park.rating,
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      Text(
                        widget.park.hora,
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.park.description,
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launch(widget.park.direcc);
                    },
                    child: Text('¿COMO LLEGAR?'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}
