import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourPlayLists extends StatefulWidget {
  const YourPlayLists({Key? key}) : super(key: key);

  @override
  _TogglePageState createState() => _TogglePageState();
}

class _TogglePageState extends State<YourPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1569982175971-d92b01cf8694?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/");
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        )),
                    Container(
                      width: 10,
                    ),
                    Text(
                      "Your Library",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/playlist_page");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.3)),
                    width: double.infinity,
                    height: 85,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://img.discogs.com/T4E9NpuyEMl7pLnVdB_yW3VadMM=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-19678042-1627819188-2291.jpeg.jpg"),
                                ),
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Text(
                              "Favoritos",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/playlist_page2");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.3)),
                    width: double.infinity,
                    height: 85,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/m4.JPG"),
                                ),
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Text(
                              "Funk",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/playlist_page3");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.3)),
                    width: double.infinity,
                    height: 85,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://i.scdn.co/image/ab67616d0000b273f9e47cf69a9429e572e9bb09"),
                                ),
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Text(
                              "Sertanejo",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
