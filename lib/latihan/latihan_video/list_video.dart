import 'package:audiovideoandroid/latihan/latihan_video/latihan_video.dart';
import 'package:audiovideoandroid/latihan/latihan_video/model_video.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  late Future<ModelVideo> futureModelVideo;

  @override
  void initState() {
    super.initState();
    futureModelVideo = fetchDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Video'),
      ),
      body: FutureBuilder<ModelVideo>(
        future: futureModelVideo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                Datum video = snapshot.data!.data[index];
                return ListTile(
                  title: Text(video.judul),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerPag(videoData: video),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          // By default, show a loading spinner
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<ModelVideo> fetchDataFromDatabase() async {
    final response = await http.get(Uri.parse('http://192.168.100.100/latihanvideo/getVideo.php'));

    if (response.statusCode == 200) {
      return ModelVideo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load video data');
    }
  }
}