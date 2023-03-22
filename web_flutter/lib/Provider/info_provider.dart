import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class InfoProvider extends ChangeNotifier {
  InfoProvider();

  Future<List<String>> getInfo() async {
    var url = "https://script.google.com/macros/s/AKfycbzjE3qDddl-FzwEcHrPS82XWgAJMoVLiJPo-IKCKrV_AM5Vgk9PExih7TuFHaH3XzQ/exec";

    var response = await http.get(Uri.parse(url));

    List<String> info = [];

    info.addAll(response.body.replaceAll("[","").replaceAll("]","").split(","));

    notifyListeners();

    return info;
  }
}
