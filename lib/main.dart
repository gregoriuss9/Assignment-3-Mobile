import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screen/post_screen.dart';
import './screen/user_screen.dart';
import './screen/album_screen.dart';
import './providers/post_provider.dart';
import './providers/user_provider.dart';
import './providers/album_provider.dart';
import './providers/album_detail_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlbumProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlbumDetailProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _index = index;
      print(index);
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    PostOverviewScreen(),
    AlbumOverviewScreen(),
    UserOverviewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: _widgetOptions.elementAt(_index)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users'),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.blue,
        onTap: _changeSelectedNavBar,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
