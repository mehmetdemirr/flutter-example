import 'package:flutter/material.dart';
import 'package:kamp3/DataClass/Users.dart';
import 'package:kamp3/ImageManager.dart';
import 'package:kamp3/main.dart';

class UserCard extends StatelessWidget {
  final Users user;
  UserCard({super.key, required this.user}) ;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        subtitle: Text(user.aciklama),
        leading: CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/200/300"),),
        title: Text(user.title),
        trailing: Icon(Icons.more_vert_outlined),
        onLongPress: (){
          print("uzun basıldı");
        },
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder:
          // (context)=> MyHomePage(title: "Mehmet")));
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyHomePage(title: "Başlık")));
        },
      )
    );
  }
}
