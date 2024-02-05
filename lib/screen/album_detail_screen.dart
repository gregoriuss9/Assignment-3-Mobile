import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/album_detail_provider.dart';
import '../card/album_detail_card.dart';

class DetailPage extends StatelessWidget {
  final int albumId;

  const DetailPage({Key? key, required this.albumId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Details'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: AlbumDetailBody(),
    );
  }
}

class AlbumDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumDetailProvider>(
      builder: (context, albumDetailProvider, child) {
        return ListView.builder(
          itemCount: albumDetailProvider.albumDetails.length,
          itemBuilder: (context, index) {
            return AlbumDetailCard(
              albumId: albumDetailProvider.albumDetails[index].albumId,
              id: albumDetailProvider.albumDetails[index].id,
              title: albumDetailProvider.albumDetails[index].title,
              url: albumDetailProvider.albumDetails[index].url,
              thumbnailUrl:
                  albumDetailProvider.albumDetails[index].thumbnailUrl,
            );
          },
        );
      },
    );
  }
}
