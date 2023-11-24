import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Text subtitle;

  const CardDetails({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 10),
            DefaultTextStyle.merge(
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              child: title,
            ),
            const SizedBox(height: 4),
            DefaultTextStyle.merge(
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
              child: subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
