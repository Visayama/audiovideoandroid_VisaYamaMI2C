import 'dart:convert'; // Tambahkan ini untuk menguraikan JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'Model_Latihan/model_audio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PageBerandaState createState() => _PageBerandaState();
}

class PageBeranda extends StatefulWidget {
  const PageBeranda({Key? key}) : super(key: key);

  @override
  State<PageBeranda> createState() => _PageBerandaState();
}

class _PageBerandaState extends State<PageBeranda> {
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
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            filteredKampusList = kampusList
                                ?.where((element) =>
                            element.nama.toLowerCase().contains(value.toLowerCase()) ||
                                element.penyanyi.toLowerCase().contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.orange,
                          labelText: "Search",
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'gambar/overdose.png',
                      fit: BoxFit.contain,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Albums',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'gambar/overdose.png',
                              fit: BoxFit.contain,
                              height: 140,
                              width: 140,
                            ),
                          ),
                          Text(
                            'Overdose',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Natori',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'gambar/nightdancer.png',
                              fit: BoxFit.contain,
                              height: 140,
                              width: 140,
                            ),
                          ),
                          Text(
                            'Night Dancer',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Imase',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'gambar/fujikaze.png',
                              fit: BoxFit.contain,
                              height: 140,
                              width: 140,
                            ),
                          ),
                          Text(
                            'Shinunegaewa',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Fuji Kaze',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'gambar/fujikaze.png',
                              fit: BoxFit.contain,
                              height: 140,
                              width: 140,
                            ),
                          ),
                          Text(
                            'Shinunegaewa',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Fuji Kaze',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For You',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                ],
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
                                icon: Icon(Icons.play_arrow),
                                color: Colors.black,
                                onPressed: () {
                                  _audioPlayer.play('http://192.168.100.100/latihan_audio/audio/${datum.audio}');
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.pause),
                                color: Colors.black,
                                onPressed: () {
                                  _audioPlayer.pause();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.stop),
                                color: Colors.black,
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

