import 'package:flutter/material.dart';
import 'package:player_m/musics/models/Product.dart';

class MusicTile extends StatelessWidget {

  final Product product;
  final void Function()? onTap;

  const MusicTile({Key? key, required this.product, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap?.call();
      },
      title: Text(product.title),
      subtitle: Text(product.singer)
    );
  }
}