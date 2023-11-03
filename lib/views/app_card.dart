import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final Icon icon;
  final Text title;
  final Text subtitle;

  const AppCard(
      {required this.icon, required this.title, required this.subtitle});

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mover a la izquierda
      children: [
        Card(
          margin: EdgeInsets.all(5.0),
          borderOnForeground: true,
          child: SizedBox(
            width: 160,
            child: ListTile(
              leading: widget.icon ?? Icon(Icons.question_mark),
              title: widget.title ?? Text('Name of the plant'),
              titleTextStyle: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              subtitle: widget.subtitle ?? Text('What it needs?'),
            ),
          ),
        )
      ],
    );
  }
}
