import 'package:flutter/material.dart';
import 'package:player_m/playlist/components_widgets/user_tile.dart';
import 'package:player_m/playlist/provider/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 20, 34, 92),

        title: Text('Your PlayLists'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/user_form");
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1569982175971-d92b01cf8694?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80"),
              fit: BoxFit.cover,
            )),
        child: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(
            users.byIndex(i),
          ),
        ),
      ),
    );
  }
}
