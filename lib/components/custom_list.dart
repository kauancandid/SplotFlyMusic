import 'package:flutter/material.dart';

Widget customListTile({String? title, String? singer, String? cover, onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      child: ListTile(
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(cover!))),
        ),
        title: Text(
          title!,
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          singer!,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    ),
  );
}
