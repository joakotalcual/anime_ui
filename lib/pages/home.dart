import 'package:anime_ui/models/anime.dart';
import 'package:anime_ui/utils/AnimeUiForYoutubeColors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime UI',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AnimeUiForYoutubeColors.background,
        textTheme: TextTheme(
          headline6: TextStyle(color: AnimeUiForYoutubeColors.cyan),
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Header(),
            Trends(),
          ],
        ),
      ),
    );
  }
}

class Trends extends StatelessWidget {
  const Trends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AspectRatio(
          aspectRatio: 16/13,
          child: Column(
            children: [
              const HeaderTrends(), // Aquí se utiliza la clase HeaderTrends
              const ListTrends(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTrends extends StatelessWidget {
  const ListTrends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints){
          return ListView.builder(
            itemCount: trendsData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 10, left: 20),
            itemBuilder: (_, index){
              final anime = trendsData[index];
              return Padding(padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth * 0.375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        child: Image.asset(anime.poster, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 7.5),
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


class HeaderTrends extends StatelessWidget{
  const HeaderTrends({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Trends',
                        style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'View all',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
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
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SliverPersistentHeader(
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
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Icon(Icons.search,color: Colors.white, size: 30),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'What would you like to watch today?',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
