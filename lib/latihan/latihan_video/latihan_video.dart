import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audiovideoandroid/latihan/latihan_video/model_video.dart';

class VideoPlayerPag extends StatefulWidget {
  final Datum videoData;

  const VideoPlayerPag({Key? key, required this.videoData}) : super(key: key);

  @override
  State<VideoPlayerPag> createState() => _VideoPlayerPagState();
}

class _VideoPlayerPagState extends State<VideoPlayerPag> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture; // Ubah menjadi _initializeVideoPlayerFuture

  @override
  void initState() {
    super.initState();
    String baseUrl = 'http://192.168.100.100/latihanvideo/getVideo.php'; // Ganti dengan URL localhost Anda
    String videoUrl = 'http://192.168.100.100/latihanvideo/video/' + widget.videoData.video;
    print('Video URL: $videoUrl');
    // Asumsikan videoData.video berisi nama file video

    _controller = VideoPlayerController.network(videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Pastikan frame pertama ditampilkan setelah video diinisialisasi
      setState(() {});
    }).catchError((error) {
      print("Error initializing video: $error"); // Tambahkan ini untuk debugging
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoData.judul),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.videoData.judul,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
