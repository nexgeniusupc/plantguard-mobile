import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../models/device/device.dart';
import '../../services/devices/devices_service.dart';
import 'plant_details_card.dart';

const List<Widget> _staticMetrics = [
  PlantDetailsCard(
    icon: Icon(Icons.lightbulb),
    title: Text('Light Intensity'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.grass),
    title: Text('Soil Moisture'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.yard),
    title: Text('Soil pH'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.food_bank),
    title: Text('Nutrient Levels'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.air),
    title: Text('CO2 Levels'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.air),
    title: Text('Air Quality'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.water_drop),
    title: Text('Water pH'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.shower),
    title: Text('Rainfall'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.air),
    title: Text('Wind Speed'),
    subtitle: Text('Unknown'),
  ),
  PlantDetailsCard(
    icon: Icon(Icons.masks),
    title: Text('Pest Control'),
    subtitle: Text('Unknown'),
  ),
];

class PlantDetailsView extends StatefulWidget {
  final DeviceListResponseData device;

  const PlantDetailsView({super.key, required this.device});

  @override
  State<PlantDetailsView> createState() => _PlantDetailsViewState();
}

class _PlantDetailsViewState extends State<PlantDetailsView> {
  late DevicesService _devicesService;
  late Future<DeviceMeasurement> _measurement;
  DeviceMeasurement? lastMeasurement;
  Timer? _timer;

  void _handleTimer(Timer? timer) {
    setState(() {
      _measurement = _devicesService.getCurrent(widget.device.id);
    });
  }

  @override
  void initState() {
    super.initState();
    _devicesService = context.read<DevicesService>();
    _measurement = _devicesService.getCurrent(widget.device.id);
    _timer = Timer.periodic(const Duration(seconds: 5), _handleTimer);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.device.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder(
          future: _measurement,
          initialData: lastMeasurement,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done &&
                !snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text(
                  'An error has occurred, please try again later.',
                ),
              );
            }

            final data = snapshot.data!;
            lastMeasurement = data;

            final items = [
              PlantDetailsCard(
                icon: const Icon(Icons.thermostat),
                title: const Text('Temperature'),
                subtitle: Text('Healthy ⋅ ${data.temperature}'),
              ),
              PlantDetailsCard(
                icon: const Icon(Icons.water_drop),
                title: const Text('Humidity'),
                subtitle: Text('Healthy ⋅ ${data.humidity}%'),
              ),
              ..._staticMetrics,
            ];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Healthy ⋅ Next water in 12 hours',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Expanded(
                  child: AlignedGridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    itemCount: items.length,
                    itemBuilder: (context, index) => items[index],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
