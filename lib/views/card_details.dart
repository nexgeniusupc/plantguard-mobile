import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
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
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Card(
            child: SizedBox(
              width: 100,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  widget.icon,
                  ListTile(
                    title: widget.title,
                    titleTextStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    subtitle: widget.subtitle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
