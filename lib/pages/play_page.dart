import 'dart:ffi';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayMusicPage extends StatefulWidget {
  const PlayMusicPage({Key? key}) : super(key: key);

  @override
  _PlayMusicPageState createState() => _PlayMusicPageState();
}

class _PlayMusicPageState extends State<PlayMusicPage> {
  //Variaveis necessárias
  //Criando o reprodutor de música
  //Primeiro vamos declarar alguns objetos
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;

  int timeProgress = 0;
  int audioDuration = 0;

  String path = "M4.mp3";

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

  playMusic() async {
    await audioCache.play(path);
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
        child: Padding(
          padding: EdgeInsets.only(top: 48.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pushNamed("/");

                }, icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                )),

                SizedBox(
                  height: 24.0,
                ),
                //Adcionando a capa da musica
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/m4.JPG"),
                        )),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    "M4",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Adicionando o tempo de execução da musica
                        //Adicionando o controle

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
                                ? getFileAudioDuration()
                                : Text(getTimeString(audioDuration), style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.skip_previous,
                                    color: Colors.white, size: 45.0)),
                            IconButton(
                              onPressed: () {
                                audioPlayerState == AudioPlayerState.PLAYING
                                    ? pauseMusic()
                                    : playMusic();
                              },
                              icon: Icon(
                                audioPlayerState == AudioPlayerState.PLAYING
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.skip_next,
                                    color: Colors.white, size: 45.0))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getFileAudioDuration() {
    return FutureBuilder(
        future: _getAudioDuration(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("");
          }
          return Text("");
        });
  }

  Future<int> _getAudioDuration() async {
    File audioFile = await audioCache.load(path);
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
    Duration newPosition = Duration(seconds: sec);
    audioPlayer.seek(newPosition);
  }
}
