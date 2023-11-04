import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import 'app_card.dart';
import 'auth/unauthenticated_view.dart';
import 'plant_details_view.dart';

class HomeView extends StatefulWidget {
  final AuthService _authService;

  const HomeView(this._authService, {super.key});

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
        actions: [
          IconButton(
            onPressed: () async {
              await widget._authService.logout();
              if (!mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => UnauthenticatedView(
                    widget._authService,
                  ),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Bedroom',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlantDetailsView(),
                    ),
                  );
                },
                child: const AppCard(
                  icon: Icon(Icons.yard),
                  title: Text('Lavander'),
                  subtitle: Text('Healthy'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Living Room',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              const Row(
                children: [
                  AppCard(
                    icon: Icon(Icons.yard),
                    title: Text('Roses'),
                    subtitle: Text('Pending Water'),
                  ),
                  AppCard(
                    icon: Icon(Icons.yard),
                    title: Text('Lavatera'),
                    subtitle: Text('Healthy'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Main Garden',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              const Row(
                children: [
                  AppCard(
                    icon: Icon(Icons.yard),
                    title: Text('Lemongrass'),
                    subtitle: Text('Pending Water'),
                  ),
                  AppCard(
                    icon: Icon(Icons.yard),
                    title: Text('Roses'),
                    subtitle: Text('Water in 1 hour'),
                  ),
                ],
              ),
              const Row(
                children: [
                  AppCard(
                    icon: Icon(Icons.yard),
                    title: Text('Strawberries'),
                    subtitle: Text('Needs Attention'),
                  ),
                  AppCard(
                    icon: Icon(Icons.yard),
                    title: Text('Tomatoes'),
                    subtitle: Text('Pending Water'),
                  ),
                ],
              ),
              const Row(
                children: [
                  AppCard(
                    icon: Icon(Icons.yard),
                    title: Text('Lavander'),
                    subtitle: Text('Water in 30 min'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        elevation: 1,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
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
