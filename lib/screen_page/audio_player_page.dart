import 'package:flutter/material.dart';
import 'player_widget.dart';

void main() => runApp(const AudioPlayerPage());

class AudioPlayerPage extends StatelessWidget {
  const AudioPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Tips: Audio Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Set URL dan nama file
  final String urlExample = "http://ia802609.us.archive.org/13/items/quraninindonesia/001AlFaatihah.mp3";
  final String nameExample = "Al-Fatihah";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Al Fatihah"),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: PlayerWidget(url: urlExample, fileName: nameExample),
          ),
        ],
      ),
    );
  }
}
