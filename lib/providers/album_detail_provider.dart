import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/album_detail_model.dart';
// import '../model/album_model.dart';

class AlbumDetailProvider with ChangeNotifier {
  List<AlbumDetailModel> _albumDetails = <AlbumDetailModel>[];
  List<AlbumDetailModel> get albumDetails {
    return [..._albumDetails];
  }

  // AlbumModel? selectedAlbum;

  Future<void> fetchAlbumsDetails(int index) async {
    try {
      final url = Uri.parse(
          'https://jsonplaceholder.typicode.com/albums/$index/photos');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      List<AlbumDetailModel> loadedData = [];

      extractedData.forEach((albums) {
        final currentAlbumData = AlbumDetailModel(
          albumId: int.parse(albums['albumId'].toString()),
          id: int.parse(albums['id'].toString()),
          title: albums['title'],
          url: albums['url'],
          thumbnailUrl: albums['thumbnailUrl'],
        );
        loadedData.add(currentAlbumData);
      });
      _albumDetails = loadedData;
    } catch (error) {
      rethrow;
    }
  }

  // void selectAlbum(AlbumModel data) {
  //   selectedAlbum = data;
  //   notifyListeners();
  // }
}


// class AlbumDetailProvider with ChangeNotifier {
//   List<AlbumDetailModel> _albumDetails = <AlbumDetailModel>[];
//   List<AlbumDetailModel> get albumDetails {
//     return [..._albumDetails];
//   }

//   Future<void> fetchAlbumsDetails(int index) async {
//     try {
//       final url = Uri.parse(
//           'https://jsonplaceholder.typicode.com/albums/$index/photos');
//       final response = await http.get(url);
//       final extractedData = json.decode(response.body) as List<dynamic>;
//       List<AlbumDetailModel> loadedData = [];

//       extractedData.forEach((albums) {
//         final currentAlbumData = AlbumDetailModel(
//           albumId: int.parse(albums['albumId'].toString()),
//           id: int.parse(albums['id'].toString()),
//           title: albums['title'],
//           url: albums['url'],
//           thumbnailUrl: albums['thumbnailUrl'],
//         );
//         loadedData.add(currentAlbumData);
//       });
//       _albumDetails = loadedData;
//     } catch (error) {
//       rethrow;
//     }
//   }

//   AlbumModel? selectedAlbum;

//   void selectAlbum(AlbumModel data) {
//     selectedAlbum = data;
//     notifyListeners();
//   }
// }
