import 'package:flutter/material.dart';
import 'app_card.dart';

class HomeView extends StatefulWidget {
  final String title;

  const HomeView({super.key, required this.title});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Bedroom',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
          ),
          AppCard(
            icon: Icon(Icons.home),
            title: Text('Lavander'),
            subtitle: Text('Healthy'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Living Room',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
          ),
          Row(
            children: [
              AppCard(
                icon: Icon(Icons.home),
                title: Text('Roses'),
                subtitle: Text('Pending Water'),
              ),
              AppCard(
                icon: Icon(Icons.home),
                title: Text('Lavatera'),
                subtitle: Text('Healthy'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Main Garden',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
          ),
          Row(
            children: [
              AppCard(
                icon: Icon(Icons.home),
                title: Text('Lemongrass'),
                subtitle: Text('Pending Water'),
              ),
              AppCard(
                icon: Icon(Icons.home),
                title: Text('Roses'),
                subtitle: Text('Water in 1 hour'),
              ),
            ],
          ),
          Row(
            children: [
              AppCard(
                icon: Icon(Icons.home),
                title: Text('Strawberries'),
                subtitle: Text('Needs Attention'),
              ),
              AppCard(
                icon: Icon(Icons.home),
                title: Text('Tomatoes'),
                subtitle: Text('Pending Water'),
              ),
            ],
          ),
          Row(
            children: [
              AppCard(
                icon: Icon(Icons.home),
                title: Text('Lavander'),
                subtitle: Text('Water in 30 min'),
              ),
            ],
          ),
        ]),
      ),
      // esa coma del final se llama trailing o dangling comma
      // acostumbrate a ponerla siempre al final
      // el formatter te va a ayudar automáticamente
      // para activar el formatter, Shift + Alt + F
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue[300],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
