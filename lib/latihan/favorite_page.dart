import 'dart:convert'; // Tambahkan ini untuk menguraikan JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'Model_Latihan/model_audio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class FavoritePage extends StatefulWidget {
  const FavoritePage ({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  ModelAudio? modelAudio;
  AudioPlayer _audioPlayer = AudioPlayer();
  TextEditingController searchController = TextEditingController();
  List<Datum>? kampusList;
  List<Datum>? filteredKampusList;

  @override
  void initState() {
    super.initState();
    fetchModelKampus();
  }

  Future<void> fetchModelKampus() async {
    final response = await http.get(Uri.parse('http://192.168.100.100/latihan_audio/getAudio.php'));
    if (response.statusCode == 200) {
      setState(() {
        var jsonResponse = json.decode(response.body);
        modelAudio = ModelAudio.fromJson(jsonResponse);
        kampusList = modelAudio?.data ?? [];
        filteredKampusList = kampusList;
      });
    } else {
      throw Exception('Gagal memuat model kampus');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              if (filteredKampusList != null)
                for (Datum datum in filteredKampusList!)
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75, // Ubah tinggi sesuai kebutuhan Anda
                      child: Center(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          title: Text(
                            datum.penyanyi,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'http://192.168.100.100/latihan_audio/gambar/${datum.gambar}',
                              fit: BoxFit.cover,
                              height: 80,
                              width: 76,
                            ),
                          ),
                          subtitle: Text(
                            datum.nama,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.favorite),
                                color: Colors.orange,
                                onPressed: () {
                                  _audioPlayer.stop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

