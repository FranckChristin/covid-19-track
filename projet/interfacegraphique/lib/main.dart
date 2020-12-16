import 'package:flutter/material.dart';

void main() {
  runApp(HeroApp());
}

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire COVID-19',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final monNom = TextEditingController();
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
            child: Text(
              "Bienvenue",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Pour debuter, entrez votre nom",
                style: TextStyle(
                    color: Colors.black, fontSize: 15)), // stocker une variable
          ),
          Container(
            width: 100,
            child: TextField(
              controller: monNom,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Entrer votre nom'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail1Screen(monNom.text)),
                  );
                },
                child: Text("continuer")),
          )
        ],
      )),
    );
  }
}

class Detail1Screen extends StatelessWidget {
  String monNom;
  Detail1Screen(String monNom) {
    this.monNom = monNom;
  }
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
              child: Text("Bienvenue " + monNom),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Pour accéder au campus aujourd'hui, tu dois completer le questionnaire."),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Detail2Screen(monNom);
                      }),
                    );
                  },
                  child: Text("Completer le questionnaire")),
            ),
          ],
        ),
      ),
    );
  }
}

// formulaire de verifation d'etat pour acceder au campus

class Detail2Screen extends StatefulWidget {
  String monNom;
  Detail2Screen(String monNom) {
    this.monNom = monNom;
  }
  @override
  Detail2ScreenState createState() => Detail2ScreenState(this.monNom);
}

class Detail2ScreenState extends State<Detail2Screen> {
  String monNom;
  int joie = 0; // 0 = null, 1 = pas content, 2 = indecennis
  int jr = 0;
  int touch = 0;
  int debut = 0;

  Detail2ScreenState(String monNom) {
    this.monNom = monNom;
  }
  @override
  Widget build(BuildContext context) {
    if (joie == 3 && touch == 2 && jr == 2)
      debut = 2; // peut se rendre en cours
    if (joie == 2 && touch == 2 && jr == 2)
      debut = 2; // peut se rendre en cours
    if (joie <= 2 || touch == 1 || jr == 1)
      debut = 1; // impossible d'assister au cours
    if (joie == 0 || touch == 0 || jr == 0) debut = 0;

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
        padding: const EdgeInsets.only(top: 15.0),
        child: Text("formulaire CoviD-19 pour " + monNom),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text("Date 2020-11-25"), // generer une date automatic
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("Aujourd'hui, je me sens :"),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.sentiment_very_dissatisfied,
              color: joie == 1 ? Colors.black : Colors.black,
              size: 30.0,
            ),
            onPressed: () {
              setState(() {
                joie = 1;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.sentiment_dissatisfied,
              color: joie == 2 ? Colors.red : Colors.black,
              size: 30.0,
            ),
            onPressed: () {
              setState(() {
                joie = 2;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.sentiment_very_satisfied,
              color: joie == 3 ? Colors.cyanAccent : Colors.black,
              size: 30.0,
            ),
            onPressed: () {
              setState(() {
                joie = 3;
              });
            },
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Text(
                  'jai voyagé hors du Canada dans les derniers 14 jours',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: 'Raleway'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.done),
                iconSize: 20.0,
                highlightColor: Colors.black,
                color: jr == 1 ? Colors.red : Colors.black,
                onPressed: () {
                  setState(() {
                    jr = 1;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.clear),
                iconSize: 20.0,
                highlightColor: Colors.greenAccent,
                color: jr == 2 ? Colors.green : Colors.black,
                onPressed: () {
                  setState(() {
                    jr = 2;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Text(
                  "J'ai été en contacte avec un individu qui as eu COVID-19 dans les derniers 14 jours",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: 'Raleway'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.done),
                iconSize: 20.0,
                highlightColor: Colors.red,
                color: touch == 1 ? Colors.red : Colors.black,
                onPressed: () {
                  setState(() {
                    touch = 1;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.clear),
                iconSize: 20.0,
                highlightColor: Colors.black,
                color: touch == 2 ? Colors.green : Colors.black,
                onPressed: () {
                  setState(() {
                    touch = 2;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: RaisedButton(
            onPressed: () {
              if (debut == 2)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail3Screen()),
                );
              if (debut == 1)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail4Screen()),
                );
            },
            child: debut != 0
                ? Text('soumettre')
                : Text('Veuillez completer le questionnaire',
                    style: TextStyle(fontWeight: FontWeight.bold))),
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

// l'accès au bâtiment

class Detail3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(children: [
        Hero(
          tag: 'imageHero',
          child: Image.network(
            "https://www.apcm.ca/wp-content/uploads/2016/09/Colle%CC%80geBore%CC%81al3.jpeg",
            width: 300,
            height: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Icon(
                    Icons.thumb_up_alt,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                ),
                Text(
                  "le Formulaire a ete completé",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Icon(
            Icons.sentiment_very_satisfied,
            color: Colors.redAccent,
            size: 50.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text("vous pouriez rentrer dans le batiment",
              style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
        ),
      ])),
    );
  }
}

// refus d'accès au bâtiment

class Detail4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(children: [
        Hero(
          tag: 'imageHero',
          child: Image.network(
            "https://www.apcm.ca/wp-content/uploads/2016/09/Colle%CC%80geBore%CC%81al3.jpeg",
            width: 300,
            height: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Icon(
                    Icons.thumb_up_alt,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                ),
                Text(
                  "le Formulaire a ete completé",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
              " desolé !! vous ne pouriez pas rentrer dans le batiment ",
              style: TextStyle(color: Colors.redAccent, fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              "veuillez entrez en contact de toute urgence avec les autorités sanitaires compétentes",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Icon(
            Icons.mood_bad,
            color: Colors.redAccent,
            size: 50.0,
          ),
        ),
      ])),
    );
  }
}
