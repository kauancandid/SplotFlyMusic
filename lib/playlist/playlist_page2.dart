import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_m/components/custom_list.dart';

class PlayListPage2 extends StatefulWidget {
  const PlayListPage2({Key? key}) : super(key: key);

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage2> {
  //Music List
  List musicList = [
    {
      'title': "Ilusao",
      'singer': "Alok ft.(Mcs)",
      'url': "ilusao.mp3",
      'coverUrl':
      "https://img.estadao.com.br/thumbs/550/resources/jpg/1/8/1605264003981.jpg"
    },
    {
      'title': "War",
      'singer': "Felipe Ret",
      'url': "war.mp3",
      'coverUrl':
      "https://images.genius.com/45fc1ca06f4910a903dbad5e8d3bcbcc.1000x1000x1.jpg"
    },
    {
      'title': "Groupies",
      'singer': "Teto",
      'url': "groupies.mp3",
      'coverUrl':
      "https://images.genius.com/6b8a61e342381461d81774069c04daee.1000x1000x1.png"
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

  ];

  String currentTile = "";
  String currentSinger = "";
  String currentCover = "";
  String currentPlay = "";

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;

  int timeProgress = 0;
  int audioDuration = 0;

  //Criando um controle deslizante personalizado
  Widget slider() {
    return Container(
      width: 250,
      child: Slider.adaptive(
          activeColor: Colors.white,
          inactiveColor: Colors.grey[350],
          value: (timeProgress / 1000).floorToDouble(),
          max: (audioDuration / 1000.floorToDouble()),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //Agora vamos inicializar nosso player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Agora vamos controlar o tempo do audioplayer
    //Esta função permitirá que você obtenha a duração da música

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });

    //Esta função nos permitirá mover o cursor do controle deslizante enquanto tocamos a música
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  playMusic(String msc) async {
    await audioCache.play(msc);
  }

  pauseMusic() async {
    await audioPlayer.pause();

  }

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
                          Navigator.of(context).pushNamed("/yourPlaylists");
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
                      "Your PlayList",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),

                    Container(
                      width: 100,
                    ),

                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/toggle_page");
                        },
                        icon: Icon(
                          Icons.autorenew_outlined,
                          size: 30,
                          color: Colors.white,
                        )),
                    Container(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/");
                        },
                        icon: Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.white,
                        )),
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1569982175971-d92b01cf8694?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x55212121),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(getTimeString(timeProgress), style: TextStyle(color: Colors.white),),
                          SizedBox(
                            width: 20,
                          ),

                          slider(),

                          SizedBox(
                            width: 20,
                          ),
                          audioDuration == 0
                              ? getFileAudioDuration(currentPlay)
                              : Text(getTimeString(audioDuration), style: TextStyle(color: Colors.white),)
                        ],
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
                                    child: Column(
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Container(
                              child: IconButton(
                                  onPressed: () {
                                    audioPlayerState == AudioPlayerState.PLAYING
                                        ? pauseMusic()
                                        : playMusic(currentPlay);
                                  },
                                  icon: Icon(
                                    audioPlayerState == AudioPlayerState.PLAYING
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getFileAudioDuration(String msc) {
    return FutureBuilder(
        future: _getAudioDuration(msc),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("");
          }
          return Text("");
        });
  }

  Future<int> _getAudioDuration(String msc) async {
    File audioFile = await audioCache.load(msc);
    await audioPlayer.setUrl(audioFile.path);
    audioDuration = await Future.delayed(
        Duration(seconds: 2), () => audioPlayer.getDuration());
    return audioDuration;
  }

  String getTimeString(int milliseconds) {
    if (milliseconds == null) milliseconds = 0;
    String minutes =
        '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds =
        '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60}';
    return '$minutes:$seconds'; // Returns a string with the format mm:ss
  }

  void seekToSec(int sec) {
    void seekToSec(int sec) {
      Duration newPosition = Duration(seconds: sec);
      audioPlayer.seek(newPosition);
    }
  }
}
