import 'package:flutter/material.dart';
import 'package:player_m/playlist/provider/users.dart';

import 'package:provider/provider.dart';

import '../user.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 20, 34, 92),
        title: Text("Creating a PlayList"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id']!,
                    name: _formData['name']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ),
                );
              }
            },
            icon: Icon(Icons.save),
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
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                    cursorColor: Colors.white,
                    initialValue: _formData['name'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Nome',
                      //enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nome inválido';
                      }
                      if (value.trim().length < 3) {
                        return 'Nome muito pequeno. No mínimo 3 letras.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['name'] = value!;
                      print(value);
                    }),
                TextFormField(
                    cursorColor: Colors.white,
                    initialValue: _formData['avatarUrl'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Url do Avatar',
                      //enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    onSaved: (value) {
                      _formData['avatarUrl'] = value!;
                      print(value);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
