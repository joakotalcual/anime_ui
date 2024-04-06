class NavBar { // Define una clase NavBar.
  final String path; // Declara una variable para la ruta del icono.
  final String name; // Declara una variable para el nombre del elemento de la barra de navegación.

  const NavBar({required this.path, required this.name}); // Constructor de la clase NavBar que recibe la ruta y el nombre como parámetros.
}

const itemsNavBar = [ // Crea una lista constante de elementos de NavBar.
  NavBar(name: 'Home', path: 'assets/icons/home.svg'), // Añade un elemento "Home" a la lista con su respectiva ruta de icono.
  NavBar(name: 'Search', path: 'assets/icons/search.svg'), // Añade un elemento "Search" a la lista con su respectiva ruta de icono.
  NavBar(name: 'Favorites', path: 'assets/icons/star.svg'), // Añade un elemento "Favorites" a la lista con su respectiva ruta de icono.
  NavBar(name: 'Profile', path: 'assets/icons/user.svg'), // Añade un elemento "Profile" a la lista con su respectiva ruta de icono.
];
