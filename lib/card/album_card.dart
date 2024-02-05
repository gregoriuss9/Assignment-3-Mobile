import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final int id;
  final String title;
  final VoidCallback onTap;

  const AlbumCard({
    Key? key,
    required this.id,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            Text(
              id.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
