import 'package:flutter/material.dart';
import 'card_details.dart';

class PlantDetailsView extends StatefulWidget {
  const PlantDetailsView({super.key});

  @override
  State<PlantDetailsView> createState() => _PlantDetailsViewState();
}

class _PlantDetailsViewState extends State<PlantDetailsView> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lavander'),
        elevation: 1,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Healthy ⋅ Next water in 12 hours',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
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
                ],
              ),
              Row(
                children: [
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
                ],
              ),
              Row(
                children: [
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
                ],
              ),
              Row(
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
