import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/album_model.dart';

class AlbumProvider with ChangeNotifier {
  List<AlbumModel> _albums = <AlbumModel>[];

  final url_albums = Uri.parse('https://jsonplaceholder.typicode.com/albums');

  List<AlbumModel> get albums {
    return [..._albums];
  }

  Future<void> fetchAlbums() async {
    try {
      final response_albums = await http.get(url_albums);
      final extractedDataAlbums =
          json.decode(response_albums.body) as List<dynamic>;
      List<AlbumModel> loadedDataAlbums = [];

      extractedDataAlbums.forEach((albums) {
        final currentAlbumData = AlbumModel(
          id: int.parse(albums['id'].toString()),
          title: albums['title'],
        );
        loadedDataAlbums.add(currentAlbumData);
      });

      _albums = loadedDataAlbums;
    } catch (e) {
      rethrow;
    }
  }
}
