class Anime { // Define una clase Anime.
  final String name; // Declara una variable para el nombre del anime.
  final double score; // Declara una variable para la puntuación del anime.
  final int number; // Declara una variable para el número del anime.
  final String poster; // Declara una variable para la ruta del póster del anime.
  const Anime({required this.name, required this.number, required this.score, required this.poster}); // Constructor de la clase Anime que recibe el nombre, número, puntuación y ruta del póster como parámetros.
}

const trendsData = [ // Crea una lista constante de datos de tendencias de anime.
  Anime(name: 'My Hero Academy', number: 201, score: 8.33, poster: 'assets/images/hero-academy.png'), // Añade un elemento de tendencia de anime a la lista.
  Anime(name: 'One Piece', number: 1303, score: 9.13, poster: 'assets/images/one-piece.png'), // Añade un elemento de tendencia de anime a la lista.
  Anime(name: 'Dragon Ball Super', number: 987, score: 8.75, poster: 'assets/images/dragon-ball-super.png'), // Añade un elemento de tendencia de anime a la lista.
];

const recentsData = [ // Crea una lista constante de datos de animes recientes.
  Anime(name: 'Somali to Mori no Kamisama', number: 1300, score: 7.64, poster: 'assets/images/somali.png'), // Añade un anime reciente a la lista.
  Anime(name: 'ID-Invaded', number: 1300, score: 7.64, poster: 'assets/images/id.png'), // Añade un anime reciente a la lista.
  Anime(name: 'Ride your wave', number: 22, score: 8.84, poster: 'assets/images/ride.png'), // Añade un anime reciente a la lista.
  Anime(name: 'Re:Zer', number: 201, score: 8.10, poster: 'assets/images/re-zer.png'), // Añade un anime reciente a la lista.
];
