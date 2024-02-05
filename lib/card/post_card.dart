import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostCard({
    Key? key,
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            body,
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          )
        ]),
      ),
    );
  }
}
