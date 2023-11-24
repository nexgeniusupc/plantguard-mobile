import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'card_details.dart';

class PlantDetailsView extends StatelessWidget {
  const PlantDetailsView({super.key});

  static const List<Widget> items = [
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Temperature'),
      subtitle: Text('Healthy ⋅ 25°C'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Humidity'),
      subtitle: Text('Healthy ⋅ 60%'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Light Intensity'),
      subtitle: Text('Healthy ⋅ 5,000 lux'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Soil Moisture'),
      subtitle: Text('Healthy ⋅ 40%'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Soil pH'),
      subtitle: Text('Healthy ⋅ 6.5pH'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Nutrient Levels'),
      subtitle: Text('Healthy'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('CO2 Levels'),
      subtitle: Text('Healthy ⋅ 400ppm'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Air Quality'),
      subtitle: Text('Healthy ⋅ 94%'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Water pH'),
      subtitle: Text('Healthy ⋅ 7.0 pH'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Rainfall'),
      subtitle: Text('No rain detected'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Wind Speed'),
      subtitle: Text('Healthy ⋅ 10 km/h'),
    ),
    CardDetails(
      icon: Icon(Icons.yard),
      title: Text('Pest Control'),
      subtitle: Text('Healthy'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
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
        ),
      ),
    );
  }
}
