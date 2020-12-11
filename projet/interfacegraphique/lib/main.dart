import 'package:flutter/material.dart';

void main() {
  runApp(Nav2App());
}

class Nav2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Image.network(
            "https://www.apcm.ca/wp-content/uploads/2016/09/Colle%CC%80geBore%CC%81al3.jpeg",
            width: 300,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Text("Bienvenue !"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Pour debuter, entrez votre nom"),
          ),
          Container(
            width: 100,
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }),
                  );
                },
                child: Text("continuer")),
          )
        ],
      )),
    );
  }
}

/*
child: FlatButton(
          child: Column(
            children: [
              Text('Premier Ecran'),
              Text('View Details'),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailScreen();
              }),
            );
          },
        ),
        */

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Column(
            children: [
              Text('Deuxieme Ecran'),
              Text('Pop!'),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
