import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../card/post_card.dart';

class PostOverviewScreen extends StatefulWidget {
  @override
  _PostOverviewScreen createState() {
    return _PostOverviewScreen();
  }
}

class _PostOverviewScreen extends State<PostOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PostProvider>(context)
          .fetchPosts()
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
  }

  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, postProvider, child) {
        return ListView.builder(
          itemCount: postProvider.posts.length,
          itemBuilder: (context, index) {
            return PostCard(
              userId: postProvider.posts[index].userId,
              id: postProvider.posts[index].id,
              title: postProvider.posts[index].title,
              body: postProvider.posts[index].body,
            );
          },
        );
      },
    );
  }
}
