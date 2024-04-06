// ignore_for_file: deprecated_member_use

import 'package:anime_ui/models/anime.dart'; // Importa el modelo de anime.
import 'package:anime_ui/models/nav_bar.dart'; // Importa el modelo de barra de navegación.
import 'package:anime_ui/utils/AnimeUiForYoutubeColors.dart'; // Importa los colores personalizados para la aplicación.
import 'package:flutter/material.dart'; // Importa el paquete Flutter Material.
import 'package:flutter_svg/flutter_svg.dart'; // Importa el paquete Flutter SVG.

void main() {
  runApp(MyApp()); // Inicia la aplicación Flutter.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de modo de depuración en la esquina superior derecha.
      title: 'Anime UI', // Define el título de la aplicación.
      theme: ThemeData.light().copyWith( // Configura el tema de la aplicación.
        scaffoldBackgroundColor: AnimeUiForYoutubeColors.background, // Configura el color de fondo del Scaffold.
        textTheme: TextTheme( // Configura los estilos de texto.
          headline6: TextStyle(color: AnimeUiForYoutubeColors.cyan), // Establece el color del titular principal.
          subtitle1: const TextStyle(color: Colors.white), // Establece el color del subtítulo 1 como blanco.
        ),
      ),
      home: const HomePage(), // Establece la página de inicio de la aplicación.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Body(), // Agrega el cuerpo de la aplicación.
            NavBar(), // Agrega la barra de navegación.
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final _index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.4,
        decoration: BoxDecoration(
          color: AnimeUiForYoutubeColors.background,
          boxShadow: [
            BoxShadow(
              color: AnimeUiForYoutubeColors.cyan.withOpacity(.45),
              spreadRadius: 7.5,
              blurRadius: 15,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            itemsNavBar.length,
            (index) => Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (_, value, __) {
                  return GestureDetector(
                    onTap: () => _index.value = index,
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            itemsNavBar[index].path,
                            width: 25,
                            height: 25,
                            color: (index == value) ? AnimeUiForYoutubeColors.cyan : Colors.grey,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            itemsNavBar[index].name,
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: (index == value) ? AnimeUiForYoutubeColors.cyan : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        Header(), // Agrega el encabezado.
        Trends(), // Agrega las tendencias.
        Recents(), // Agrega los recientes.
        Aviable(), // Agrega los disponibles.
        SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight * 1.4)),
      ],
    );
  }
}

class Aviable extends StatelessWidget {
  const Aviable({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Available: Kimetsu No Yaiba',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/kimetsu.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    child: SvgPicture.asset(
                      'assets/icons/play_awesome.svg',
                      width: 85,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AspectRatio(
          aspectRatio: 16 / 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recently added',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const ListRecents(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListRecents extends StatelessWidget {
  const ListRecents({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return ListView.builder(
            itemCount: recentsData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, top: 10),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(recentsData[index].poster, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Trends extends StatelessWidget {
  const Trends({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: AspectRatio(
          aspectRatio: 16 / 12,
          child: Column

(
            children: [
              HeaderTrends(), // Aquí se utiliza la clase HeaderTrends
              ListTrends(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTrends extends StatelessWidget {
  const ListTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          return ListView.builder(
            itemCount: trendsData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 10, left: 20),
            itemBuilder: (_, index) {
              final anime = trendsData[index];
              final style = Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600);
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.375,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(anime.poster, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        anime.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7.5),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/logo_evil.svg', width: 15, height: 15),
                          const SizedBox(width: 5),
                          Text(
                            'Score: ${anime.score}',
                            style: style,
                          ),
                          const SizedBox(height: 7.5),
                          Text(
                            ' #${anime.number}',
                            style: style?.copyWith(color: AnimeUiForYoutubeColors.cyan),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HeaderTrends extends StatelessWidget {
  const HeaderTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Trends',
              style: TextStyle(
                fontSize: 26, // Tamaño de fuente deseado
                fontWeight: FontWeight.bold, // Peso de fuente deseado
                color: Colors.white, //color de fuente
              ),
            ),
          ),
          Text(
            'View all',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AnimeUiForYoutubeColors.cyan,
                  fontWeight: FontWeight.w700,
                ),
          )
        ],
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  HeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: HeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          color: AnimeUiForYoutubeColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'My Anime Stream',
                      style: TextStyle(
                        fontSize: 16, // Tamaño de fuente deseado
                        fontWeight: FontWeight.bold, // Peso de fuente deseado
                        color: AnimeUiForYoutubeColors.cyan, //color de fuente
                      ),
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.white, size: 30),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'What would you like to watch today?',
                style: TextStyle(
                  fontSize: 14, // Tamaño de fuente deseado
                  fontWeight: FontWeight.bold, // Peso de fuente deseado
                  color: Colors.white, //color de fuente
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}