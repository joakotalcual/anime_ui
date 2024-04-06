class NavBar{
  final String path;
  final String name;

  const NavBar({required this.path, required this.name});
}

const itemsNavBar = [
  NavBar(path: 'Home', name: 'assets/icons/home.svg'),
  NavBar(path: 'Search', name: 'assets/icons/search.svg'),
  NavBar(path: 'Favorites', name: 'assets/icons/star.svg'),
  NavBar(path: 'Profile', name: 'assets/icons/user.svg'),
];