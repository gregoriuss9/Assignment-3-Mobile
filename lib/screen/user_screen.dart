import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../card/user_card.dart';

class UserOverviewScreen extends StatefulWidget {
  @override
  _UserOverviewScreen createState() {
    return _UserOverviewScreen();
  }
}

class _UserOverviewScreen extends State<UserOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<UserProvider>(context)
          .fetchUsers()
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
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return ListView.builder(
          itemCount: userProvider.users.length,
          itemBuilder: (context, index) {
            return UserCard(
                id: userProvider.users[index].id,
                name: userProvider.users[index].name,
                username: userProvider.users[index].username,
                email: userProvider.users[index].email,
                street: userProvider.users[index].street,
                suite: userProvider.users[index].suite,
                city: userProvider.users[index].city,
                zipcode: userProvider.users[index].zipcode,
                lat: userProvider.users[index].lat,
                lng: userProvider.users[index].lng,
                phone: userProvider.users[index].phone,
                website: userProvider.users[index].website,
                company_name: userProvider.users[index].company_name,
                company_catchPhrase:
                    userProvider.users[index].company_catchPhrase,
                company_bs: userProvider.users[index].company_bs);
          },
        );
      },
    );
  }
}
