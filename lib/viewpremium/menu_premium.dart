import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_turism/controllers/lista.dart';
import 'package:app_turism/templates/color.dart';
import 'package:app_turism/controllers/lugares.dart'; // Asegúrate de tener tu modelo Lugar
import 'package:app_turism/views/parque_page.dart';

class MenuPremium extends StatefulWidget {
  @override
  _MenuPremiumPageState createState() => _MenuPremiumPageState();
}

class _MenuPremiumPageState extends State<MenuPremium> {
  final PageController _pageController = PageController();
  String _entertainmentTitle = 'Entretenimiento';
  String _selectedMenuItem = 'BIENVENIDO';

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

  void _selectMenuItem(String menuItem) {
    setState(() {
      _selectedMenuItem = menuItem;
    });
    Navigator.pop(context); // Cierra el drawer después de seleccionar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: thirdColor,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'cerrar sesion') {
                Navigator.pushNamed(context, 'login');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'contacto',
                  child: Text('Cerrar Sesion'.toUpperCase()),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Color.fromARGB(255, 12, 12, 12)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('lib/imagenes/discoverlogo.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'ADMINISTRACIÓN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.teal,
              ),
              title: const Text(
                'INICIO',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                _selectMenuItem('INICIO');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.teal,
              ),
              title: const Text(
                'HISTORIA',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'santod_page');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.save,
                color: Colors.teal,
              ),
              title: const Text(
                'GUARDADOS',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                _selectMenuItem('FAVORITOS');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.book_online,
                color: Colors.teal,
              ),
              title: const Text(
                'ENCUESTAS',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                _selectMenuItem('ENCUESTAS');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.location_on,
                color: Colors.teal,
              ),
              title: const Text(
                'LOCALIZACION',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                _selectMenuItem('LOCALIZACION');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.close,
                color: Colors.teal,
              ),
              title: const Text(
                'CERRAR SESIÓN',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                ;
              },
            ),
            const Divider(),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_selectedMenuItem) {
      case 'INICIO':
        return Column(
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
                itemCount: (lugarMenu.length / 6).ceil(),
                itemBuilder: (context, index) {
                  return _buildPlacePage(index);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      case 'CLIENTES':
        return Center(child: Text('CLIENTES seleccionados'));
      case 'ORDEN DE TRABAJO':
        return Center(child: Text('ORDEN DE TRABAJO seleccionada'));
      case 'ENCUESTAS':
        return Center(child: Text('ENCUESTAS seleccionadas'));
      case 'LOCALIZACION':
        return Center(child: Text('LOCALIZACION seleccionada'));
      case 'CERRAR SESIÓN':
        return Center(child: Text('CERRAR SESIÓN seleccionada'));
      default:
        return Center(child: Text('BIENVENIDO'));
    }
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
    int elementsPerPage = 6;
    int startIndex = index * elementsPerPage;
    int endIndex = (index + 1) * elementsPerPage;

    if (startIndex >= lugarMenu.length) {
      return Center(child: Text('No hay lugares disponibles.'));
    }

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
            const SizedBox(height: 10),
            Text(
              lugar.name,
              style: GoogleFonts.dmSerifDisplay(
                color: Color.fromARGB(242, 34, 34, 34),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
