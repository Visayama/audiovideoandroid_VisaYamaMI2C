// To parse this JSON data, do
//
//     final modelAudio = modelAudioFromJson(jsonString);

import 'dart:convert';

ModelAudio modelAudioFromJson(String str) => ModelAudio.fromJson(json.decode(str));

String modelAudioToJson(ModelAudio data) => json.encode(data.toJson());

class ModelAudio {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelAudio({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelAudio.fromJson(Map<String, dynamic> json) => ModelAudio(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String nama;
  String audio;
  String gambar;
  String penyanyi;

  Datum({
    required this.id,
    required this.nama,
    required this.audio,
    required this.gambar,
    required this.penyanyi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["Nama"],
    audio: json["Audio"],
    gambar: json["gambar"],
    penyanyi: json["penyanyi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Nama": nama,
    "Audio": audio,
    "gambar": gambar,
    "penyanyi": penyanyi,
  };
}
