import 'package:flutter/material.dart';

class AlbumDetailCard extends StatelessWidget {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const AlbumDetailCard({
    Key? key,
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              id.toString(),
            ),
            Text(
              title,
            ),
            Image.network(url),
          ],
        ),
      ),
    );
  }
}
