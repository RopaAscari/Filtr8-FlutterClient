import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String URL = "http://10.0.2.2:8080";

class Api {
  Future<http.Response> login(obj) async {
    return await http.post(URL + '/user/login');
  }

  Future<List<dynamic>> getGully() async {
    var gully = await http.get((URL + '/gully/all'));
    return json.decode(gully.body);
  }

  Future<List<dynamic>> getStatistics() async {
    var stats = await http.get((URL + '/statistics/all'));
    return json.decode(stats.body);
  }

  Future<http.Response> addData(obj) async {
    return await http.post(URL + '', body: obj);
  }

  Future<http.Response> removeData(obj) async {
    return await http.delete(URL + '' + obj);
  }

  Future<http.Response> updateData(obj) async {
    return await http.put(URL + '', body: obj);
  }
}
