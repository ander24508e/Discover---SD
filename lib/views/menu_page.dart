import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_turism/controllers/lista.dart';
import 'package:app_turism/templates/color.dart';
import 'package:app_turism/controllers/lugares.dart'; // Asegúrate de tener tu modelo Lugar
import 'parque_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final PageController _pageController = PageController();
  String _entertainmentTitle = 'Entretenimiento';

  void navigatePageLocations(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => navigateLocations(
          park: lugarMenu[index],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      // Actualiza el título según el índice de la página actual
      switch (index) {
        case 0:
          _entertainmentTitle = 'Entretenimiento - Parte 1';
          break;
        case 1:
          _entertainmentTitle = 'Entretenimiento - Parte 2';
          break;
        case 2:
          _entertainmentTitle = 'Entretenimiento - Parte 3';
          break;
        default:
          _entertainmentTitle = 'Entretenimiento';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Color de fondo gris claro
      appBar: AppBar(
        backgroundColor: thirdColor,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'publicar') {
                Navigator.pushNamed(context, 'santod_page');
              } else if (value == 'contacto') {
                Navigator.pushNamed(context, 'code_tech');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'publicar',
                  child: Text('Historia de Santo Domingo'.toUpperCase()),
                ),
                PopupMenuItem<String>(
                  value: 'contacto',
                  child: Text('Publica con nosotros'.toUpperCase()),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
        title: Text(
          'Tierrita Tsachila'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildSearchField(),
          const SizedBox(height: 25),
          Center(
            child: Text(
              _entertainmentTitle.toUpperCase(),
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount:
                  (lugarMenu.length / 6).ceil(), // Calcula el número de páginas
              itemBuilder: (context, index) {
                return _buildPlacePage(index);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fourthColor),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(242, 34, 34, 34)),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: "Buscar aquí",
          prefixIcon:
              Icon(Icons.search, color: Color.fromARGB(242, 34, 34, 34)),
        ),
      ),
    );
  }

  Widget _buildPlacePage(int index) {
    // Ajusta el número de elementos por página
    int elementsPerPage = 6;
    int startIndex = index * elementsPerPage;
    int endIndex = (index + 1) * elementsPerPage;

    // Asegúrate de que no intentas acceder a índices fuera del rango
    if (startIndex >= lugarMenu.length) {
      return Center(child: Text('No hay lugares disponibles.'));
    }

    // Ajusta el rango de elementos a mostrar
    endIndex = endIndex > lugarMenu.length ? lugarMenu.length : endIndex;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: endIndex - startIndex,
      itemBuilder: (context, i) {
        return _buildPlaceItem(lugarMenu[startIndex + i]);
      },
    );
  }

  Widget _buildPlaceItem(Lugar lugar) {
    return GestureDetector(
      onTap: () => navigatePageLocations(lugarMenu.indexOf(lugar)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () => navigatePageLocations(lugarMenu.indexOf(lugar)),
                  child: Image.asset(
                    lugar.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              lugar.name,
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
