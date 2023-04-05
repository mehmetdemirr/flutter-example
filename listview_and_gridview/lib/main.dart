import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("APP"),
                Spacer(),
                IconButton(
                  onPressed: (){
                    print("info tıklandı");
                  },
                  icon: Icon(Icons.info_outline),
                ),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert_outlined),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                          child: Text("Kişiler"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Deneme"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Ayarlar"),
                      ),
                    ]
                ),
              ],
            ),
          ],
        ),
      ),
      body: /*
      Column(
        children: [
          ListView(
            children:[
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text("Başlık"),
                trailing: PopupMenuButton(
                  icon: Icon(Icons.more_vert_outlined),
                  itemBuilder: (context)=>[
                    PopupMenuItem(
                      value:1,
                        child: Text("Kişiler"),
                    ),
                    PopupMenuItem(
                      value:2,
                      child: Text("Ayarlar"),
                    ),
                  ],
                ),
                onTap: (){
                  print("Tıklanıldı");
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text("Başlık"),
                trailing: PopupMenuButton(
                  icon: Icon(Icons.more_vert_outlined),
                  itemBuilder: (context)=>[
                    PopupMenuItem(
                      value:1,
                      child: Text("Kişiler"),
                    ),
                    PopupMenuItem(
                      value:2,
                      child: Text("Ayarlar"),
                    ),
                  ],
                ),
                onTap: (){
                  print("Tıklanıldı");
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text("Başlık"),
                trailing: PopupMenuButton(
                  icon: Icon(Icons.more_vert_outlined),
                  itemBuilder: (context)=>[
                    PopupMenuItem(
                      value:1,
                      child: Text("Kişiler"),
                    ),
                    PopupMenuItem(
                      value:2,
                      child: Text("Ayarlar"),
                    ),
                  ],
                ),
                onTap: (){
                  print("Tıklanıldı");
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text("Başlık"),
                trailing: PopupMenuButton(
                  icon: Icon(Icons.more_vert_outlined),
                  itemBuilder: (context)=>[
                    PopupMenuItem(
                      value:1,
                      child: Text("Kişiler"),
                    ),
                    PopupMenuItem(
                      value:2,
                      child: Text("Ayarlar"),
                    ),
                  ],
                ),
                onTap: (){
                  print("Tıklanıldı");
                },
              ),
            ],
          ),
      */
      GridView.count(
             crossAxisCount: 3,
             childAspectRatio: 2/1,
             children: [
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.ac_unit),
                 ],
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.ac_unit),
                 ],
               ),

               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.ac_unit),
                 ],
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.ac_unit),
                 ],
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.ac_unit),
                 ],
               ),
             ],
          ),
      );
  }
}
