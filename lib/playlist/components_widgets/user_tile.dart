import 'package:flutter/material.dart';
import 'package:player_m/playlist/provider/users.dart';

import 'package:provider/provider.dart';

import '../user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return GestureDetector(
      onTap:(){
        Navigator.of(context).pushNamed("/playlist_page");
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.black.withOpacity(0.3)),
        child: ListTile(
          leading: avatar,
          title: Text(
            user.name,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      "/user_form",
                      arguments: user,
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Excluir Usuário'),
                        content: Text('Tem certeza?'),
                        actions: [
                          FlatButton(
                            child: Text('Não'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          FlatButton(
                            child: Text('Sim'),
                            onPressed: () => Navigator.of(context).pop(true),
                          )
                        ],
                      ),
                    ).then(
                      (confirmed) {
                        if (confirmed) {
                          Provider.of<Users>(context).remove(user);
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
