// @dart=2.9
import 'package:flutter/material.dart';
import 'package:player_m/pages/home_page.dart';
import 'package:player_m/pages/musicas.dart';
import 'package:player_m/pages/play_page.dart';
import 'package:player_m/playlist/playlist_page.dart';
import 'package:player_m/playlist/provider/users.dart';
import 'package:player_m/playlist/views/user_form.dart';
import 'package:player_m/playlist/views/user_list.dart';
import 'package:player_m/toggle/toggle_page.dart';
import 'package:provider/provider.dart';

import 'playlist/playlist_page2.dart';
import 'playlist/playlist_page3.dart';
import 'playlist/playlist_page_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          "/": (context) => HomePage(),
          '/play_page': (context) => PlayMusicPage(),
          '/playlist_page': (context) => PlayListPage(),
          '/playlist_page2': (context) => PlayListPage2(),
          '/playlist_page3': (context) => PlayListPage3(),
          '/user_list': (context) => UserList(),
          '/user_form': (context) => UserForm(),
          '/songs_page': (context) => Musics(),
          '/toggle_page': (context) => TogglePage(),
          '/yourPlaylists': (context) => YourPlayLists(),
        },
      ),
    );
  }
}