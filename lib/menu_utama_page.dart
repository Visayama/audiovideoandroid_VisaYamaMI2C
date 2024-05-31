import 'package:audiovideoandroid/screen_page/audio_player_page.dart';
import 'package:audiovideoandroid/screen_page/video_player_page.dart';
import 'package:flutter/material.dart';

class MenuUtamaPage extends StatefulWidget {
  const MenuUtamaPage({super.key});

  @override
  State<MenuUtamaPage> createState() => _MenuUtamaPageState();
}

class _MenuUtamaPageState extends State<MenuUtamaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Media Player App'),
      ),
          body: Center(
            child: ListView(
              children: [
                SizedBox(height:20,),
                MaterialButton(
                  onPressed: (){
                    // Berpindah ke halaman Audio Player saat tombol Audio Player ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AudioPlayerPage()),
                    );
                  },
                  child: Text('Audio Player'),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                ),
                SizedBox(height:20,),
                MaterialButton(
                  onPressed: (){
                    // Berpindah ke halaman Audio Player saat tombol Audio Player ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoPlayerPage()),
                    );
                  },
                  child: Text('Video Player'),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                ),
              ],
            ),
    ),
    );
  }
}
