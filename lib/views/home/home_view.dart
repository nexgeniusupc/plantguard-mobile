import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../models/device/device.dart';
import '../../services/auth/auth_service.dart';
import '../../services/devices/devices_service.dart';
import 'home_card.dart';
import '../auth/unauthenticated_view.dart';
import '../pairing/add_device_view.dart';
import '../details/plant_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late DevicesService _devicesService;
  late Future<List<DeviceListResponseData>> _devices;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _devicesService = context.read<DevicesService>();
    _devices = _devicesService.getAll();
  }

  Future<void> handleLogout() async {
    final authService = context.read<AuthService>();
    await authService.logout();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const UnauthenticatedView(),
      ),
      (route) => false,
    );
  }

  void handleDetail(DeviceListResponseData device) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantDetailsView(device: device),
      ),
    );
  }

  Future<void> handleAdd() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddDeviceView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: handleLogout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Bedroom',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _devices,
                initialData: null,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return const Center(
                      child: Text(
                        'An error has occurred, please try again later.',
                      ),
                    );
                  }

                  final devices = snapshot.data!;

                  return AlignedGridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    itemCount: devices.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => handleDetail(devices[index]),
                      child: HomeCard(
                        icon: const Icon(Icons.yard),
                        title: Text(devices[index].name),
                        subtitle: const Text('Healthy'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: handleAdd,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
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
