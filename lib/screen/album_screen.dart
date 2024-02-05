import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/album_provider.dart';
import '../card/album_card.dart';
import './album_detail_screen.dart';

class AlbumOverviewScreen extends StatefulWidget {
  @override
  _AlbumOverviewScreen createState() {
    return _AlbumOverviewScreen();
  }
}

class _AlbumOverviewScreen extends State<AlbumOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AlbumProvider>(context)
          .fetchAlbums()
          .then((_) {})
          .catchError((err) {
        print(err);
      }).whenComplete(
        () {
          _init = false;
          setState(() {
            _isLoading = false;
          });
        },
      );
    }
    ;
  }

  void _navigateToDetailPage(int albumId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(albumId: albumId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumProvider>(builder: (context, albumProvider, child) {
      return ListView.builder(
          itemCount: albumProvider.albums.length,
          itemBuilder: (context, index) {
            return AlbumCard(
              id: albumProvider.albums[index].id,
              title: albumProvider.albums[index].title,
              onTap: () =>
                  _navigateToDetailPage(albumProvider.albums[index].id),
            );
          });
    });
  }
}
