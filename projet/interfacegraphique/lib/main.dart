import 'package:flutter/material.dart';

void main() {
  runApp(HeroApp());
}

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Hero(
            tag: 'imageHero',
            child: Image.network(
              "https://www.apcm.ca/wp-content/uploads/2016/09/Colle%CC%80geBore%CC%81al3.jpeg",
              width: 300,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Text("Bienvenue !"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Text("Pour debuter, entrez votre nom"), // stocker une variable
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
                      return DetailS1creen();
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

class DetailS1creen extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'imageHero',
              child: Image.network(
                "https://www.apcm.ca/wp-content/uploads/2016/09/Colle%CC%80geBore%CC%81al3.jpeg",
                width: 300,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text("Bienvenue !"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Pour accéder au campus aujourd'hui, tu dois completer le questionnaire."),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Detail2Screen();
                      }),
                    );
                  },
                  child: Text("Completer le questionnaire")),
            )
          ],
        ),
      ),
    );
  }
}

class Detail2Screen extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: 'imageHero',
        child: Image.network(
          "https://www.apcm.ca/wp-content/uploads/2016/09/Colle%CC%80geBore%CC%81al3.jpeg",
          width: 300,
          height: 200,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text("formulaire CoviD-19 pour "),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text("Date 2020-11-25"),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("Aujourd'hui, je me sens :"),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.sentiment_very_dissatisfied,
            color: Colors.black,
            size: 30.0,
          ),
          Icon(
            Icons.sentiment_dissatisfied,
            color: Colors.black,
            size: 30.0,
          ),
          Icon(
            Icons.mood,
            color: Colors.black,
            size: 30.0,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                  'jai envoyé hors du Canada dans les derniers 14 jours',
                  textAlign: TextAlign.left),
            ),
            Icon(
              Icons.clear,
              color: Colors.black,
              size: 30.0,
            ),
            Icon(
              Icons.done,
              color: Colors.black,
              size: 30.0,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                  "J'ai été en contacte avec un individu qui as eu COVID-19 dans les derniers 14 jours",
                  textAlign: TextAlign.left),
            ),
            Icon(
              Icons.clear,
              color: Colors.black,
              size: 30.0,
            ),
            Icon(
              Icons.done,
              color: Colors.black,
              size: 30.0,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Soumettre")),
      )
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: children2,
        ),
      ),
    );
  }
}
