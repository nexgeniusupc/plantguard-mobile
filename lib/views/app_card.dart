import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
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
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(5.0),
          borderOnForeground: true,
          child: SizedBox(
            width: 160,
            child: ListTile(
              leading: widget.icon,
              title: widget.title,
              titleTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              subtitle: widget.subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
