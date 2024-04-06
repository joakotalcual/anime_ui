class Anime{
  final String name;
  final double score;
  final int number;
  final String poster;
  const Anime({required this.name, required this.number, required this.score,  required this.poster});
}

const trendsData = [
  Anime(name: 'My Hero Academy', number: 201, score: 8.33, poster: 'assets/images/hero-academy.png'),
  Anime(name: 'One Piece', number: 1303, score: 9.13, poster: 'assets/images/one-piece.png'),
  Anime(name: 'Dragon Ball Super', number: 987, score: 8.75, poster: 'assets/images/dragon-ball-super.png'),
];

const recentsData = [
  Anime(name: 'Somali to Mori no Kamisama', number: 1300, score: 7.64, poster: 'assets/images/somali.png'),
  Anime(name: 'ID-Invaded', number: 1300, score: 7.64, poster: 'assets/images/id.png'),
  Anime(name: 'Ride your wave', number: 22, score: 8.84, poster: 'assets/images/ride.png'),
  Anime(name: 'Re:Zer', number: 201, score: 8.10, poster: 'assets/images/re-zer.png'),
];