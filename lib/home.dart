import 'package:flutter/material.dart';
import 'package:dmi_practica08_200070/common/HttpHandler.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  _loadJson() async {
    dynamic data = await HttpHandler()
        .fetchMovies(); // Cambiado el tipo de 'data' a 'dynamic'
    if (data is String) {
      print(data);
    } else {
      // Manejar el caso en que 'data' no sea de tipo String
      print('El tipo de dato no es String.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp - 200070"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Material()),
            ListTile(
              title: Text("Peliculas"),
              trailing: Icon(Icons.local_movies),
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Televisión"),
              trailing: Icon(Icons.live_tv_rounded),
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Cerrar"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(), // Reemplaza PageView con el widget que desees mostrar.
      bottomNavigationBar: BottomNavigationBar(
        items: _obtenerIconos(),
      ),
    );
  }

  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_rounded), label: "Populares"),
      BottomNavigationBarItem(
          icon: Icon(Icons.update_rounded), label: "Próximamente"),
      BottomNavigationBarItem(
          icon: Icon(Icons.star_rounded), label: "Favoritos"),
    ];
  }
}
