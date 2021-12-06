import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player_m/musics/bloc/music_bloc.dart';
import 'package:player_m/musics/models/Product.dart';
import 'package:player_m/musics/services/music_services.dart';
import 'package:player_m/musics/widgets/music_tile.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({Key? key}) : super(key: key);

  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(title: Text('Avaliable Songs'),
    backgroundColor: Color.fromARGB(255, 20, 34, 92)
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            "https://images.unsplash.com/photo-1569982175971-d92b01cf8694?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80"),
        fit: BoxFit.cover,
      )),
      child: FutureBuilder<List<Product>>(
          future: MusicServices.getProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 20, 34, 92),));
            return Column(children: [
              ...snapshot.data!.map((product) {
                return MusicTile(
                    product: product,
                    onTap: () {
                      BlocProvider.of<MusicBloc>(context).addProduct(product);
                    });
              })
            ]);
          }),
    );
  }
}
