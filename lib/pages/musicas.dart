import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_m/components/custom_list.dart';

class Musics extends StatefulWidget {
  const Musics({Key? key}) : super(key: key);

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<Musics> {
  //Music List
  List musicList = [
    {
      'title': "Happier Than Ever",
      'singer': "Billie Eilish",
      'url': "BillieEilishHappierThanEver.mp3",
      'coverUrl':
          "https://img.discogs.com/T4E9NpuyEMl7pLnVdB_yW3VadMM=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-19678042-1627819188-2291.jpeg.jpg"
    },
    {
      'title': "Intentions",
      'singer': "Justin Bieber",
      'url': "JustinBieberIntentions.mp3",
      'coverUrl':
          "https://studiosol-a.akamaihd.net/uploadfile/letras/albuns/3/5/8/0/851061581677500.jpg"
    },
    {
      'title': "Quer Voar",
      'singer': "Matuê",
      'url': "MatueQueroVoar.mp3",
      'coverUrl':
          "https://i.scdn.co/image/ab67616d0000b273e18fdab2c030bd3aed5c2afb"
    },
    {
      'title': "Volta comigo bb",
      'singer': "Zé Vaqueiro",
      'url': "ZeVaqueiroVoltaComigoBb.mp3",
      'coverUrl':
          "https://i.scdn.co/image/ab67616d0000b273f9e47cf69a9429e572e9bb09"
    },
    {
      'title': "Banco",
      'singer': "Matuê",
      'url': "MatueBanco.mp3",
      'coverUrl':
          "https://i.scdn.co/image/ab67616d0000b2739204986300e6e92f80361a80"
    },
    {
      'title': "Moshi Moshi",
      'singer': "Pyrxciter & Young zetton",
      'url': "MoshiMoshi.mp3",
      'coverUrl':
          "https://i.scdn.co/image/ab67616d0000b27342120bb8b50bab3f42cc4524"
    },
    {
      'title': "Putariazinha",
      'singer': "Felipie amorim",
      'url': "BillieEilishHappierThanEver.mp3",
      'coverUrl':
      "https://yt3.ggpht.com/rselugcGUmr5kGLNvd_kC_pNqs1inUjAjqcxlTOETFHbmCTtALEQ2v6DO5iWcpged9b95Rpy_Yk=s900-c-k-c0x00ffffff-no-rj"
    },
    {
      'title': "Ama Eu",
      'singer': "Felipe Amorim",
      'url': "JustinBieberIntentions.mp3",
      'coverUrl':
      "https://is5-ssl.mzstatic.com/image/thumb/Music115/v4/36/65/d5/3665d502-704e-8343-564a-0aaae3e8b9b2/cover.jpg/400x400cc.jpg"
    },
    {
      'title': "Se for Amor",
      'singer': "João Gomes e Vitor Fernandes",
      'url': "MatueBanco.mp3",
      'coverUrl':
      "https://i1.sndcdn.com/artworks-S65h7uGLmUK2-0-t500x500.png"
    },
    {
      'title': "Meu Bem",
      'singer': "João Gomes",
      'url': "MoshiMoshi.mp3",
      'coverUrl':
      "https://www.brennocds.net/cds/img400/15d2fc8ff2e272b77c402b94cc8e6822.jpg"
    },
    {
      'title': "Quer Voar",
      'singer': "Matuê",
      'url': "MatueQueroVoar.mp3",
      'coverUrl':
          "https://i.scdn.co/image/ab67616d0000b273e18fdab2c030bd3aed5c2afb"
    },
    {
      'title': "Happier Than Ever",
      'singer': "Billie Eilish",
      'url': "BillieEilishHappierThanEver.mp3",
      'coverUrl':
          "https://img.discogs.com/T4E9NpuyEMl7pLnVdB_yW3VadMM=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-19678042-1627819188-2291.jpeg.jpg"
    },
    {
      'title': "Intentions",
      'singer': "Justin Bieber",
      'url': "JustinBieberIntentions.mp3",
      'coverUrl':
          "https://studiosol-a.akamaihd.net/uploadfile/letras/albuns/3/5/8/0/851061581677500.jpg"
    },
    {
      'title': "Quer Voar",
      'singer': "Matuê",
      'url': "MatueQueroVoar.mp3",
      'coverUrl':
          "https://i.scdn.co/image/ab67616d0000b273e18fdab2c030bd3aed5c2afb"
    },
    {
      'title': "Happier Than Ever",
      'singer': "Billie Eilish",
      'url': "BillieEilishHappierThanEver.mp3",
      'coverUrl':
          "https://img.discogs.com/T4E9NpuyEMl7pLnVdB_yW3VadMM=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-19678042-1627819188-2291.jpeg.jpg"
    },
    {
      'title': "Ilusao",
      'singer': "Alok ft.(Mcs)",
      'url': "BillieEilishHappierThanEver.mp3",
      'coverUrl':
      "https://img.estadao.com.br/thumbs/550/resources/jpg/1/8/1605264003981.jpg"
    },
    {
      'title': "War",
      'singer': "Felipe Ret",
      'url': "JustinBieberIntentions.mp3",
      'coverUrl':
      "https://images.genius.com/45fc1ca06f4910a903dbad5e8d3bcbcc.1000x1000x1.jpg"
    },
    {
      'title': "Groupies",
      'singer': "Teto",
      'url': "MatueQueroVoar.mp3",
      'coverUrl':
      "https://images.genius.com/6b8a61e342381461d81774069c04daee.1000x1000x1.png"
    },
  ];

  String currentTile = "";
  String currentSinger = "";
  String currentCover = "";
  String currentPlay = "";

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
          child: Column(
            children: [
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
                    "Songs",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: musicList.length,
                    itemBuilder: (context, index) => customListTile(
                          onTap: () {
                            setState(() {
                              currentTile = musicList[index]['title'];
                              currentSinger = musicList[index]['singer'];
                              currentCover = musicList[index]['coverUrl'];
                              currentPlay = musicList[index]['url'];
                            });
                          },
                          title: musicList[index]['title'],
                          singer: musicList[index]['singer'],
                          cover: musicList[index]['coverUrl'],
                        )),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(currentCover))),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Expanded(
                        child: Center(
                          child: Container(
                            child: Row(
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentTile,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        currentSinger,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ]),
                                IconButton(onPressed: (){
                                  Navigator.of(context).pushNamed("/yourPlaylists");
                                }, icon: Icon(
                                  Icons.add_circle,
                                  size: 30,
                                  color: Colors.white,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
