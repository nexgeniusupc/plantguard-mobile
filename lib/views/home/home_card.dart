import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Text subtitle;

  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icon,
        title: title,
        subtitle: subtitle,
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        subtitleTextStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
