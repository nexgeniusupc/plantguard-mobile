import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Text subtitle;

  const AppCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: ListTile(
        leading: icon,
        title: title,
        titleTextStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        subtitle: subtitle,
      ),
    );
  }
}
