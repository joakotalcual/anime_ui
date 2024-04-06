import 'package:anime_ui/pages/home.dart';
import 'package:anime_ui/utils/AnimeUiForYoutubeColors.dart'; // Importa los colores personalizados para la aplicación.
import 'package:flutter/material.dart'; // Importa el paquete Flutter Material.
import 'package:flutter/services.dart'; // Importa el paquete Flutter para acceder a la configuración del sistema.
import 'package:google_fonts/google_fonts.dart'; // Importa el paquete Google Fonts para utilizar fuentes personalizadas.

void main() {
  runApp(MyApp()); // Inicia la aplicación Flutter.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Configura el color de la barra de estado como transparente.
        statusBarIconBrightness: Brightness.light, // Configura el brillo de los íconos de la barra de estado como claro.
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de modo de depuración en la esquina superior derecha.
      title: 'Anime UI', // Define el título de la aplicación.
      theme: ThemeData.light().copyWith( // Configura el tema de la aplicación.
        scaffoldBackgroundColor: AnimeUiForYoutubeColors.background, // Configura el color de fondo del Scaffold.
        //textTheme: GoogleFonts.sourceSansProTextTheme(), // Configura la fuente del texto utilizando Google Fonts.
      ),
      home: HomePage(), // Establece la página de inicio de la aplicación.
    );
  }
}
