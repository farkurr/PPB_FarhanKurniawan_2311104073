import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  Future<void> createPost() async {
    await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Post Baru',
        'body': 'Contoh MVVM',
        'userId': 1,
      }),
    );
  }

  Future<void> updatePost() async {
    await http.put(
      Uri.parse('$baseUrl/posts/1'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Update MVVM',
        'body': 'Data diperbarui',
        'userId': 1,
      }),
    );
  }

  Future<void> deletePost() async {
    await http.delete(Uri.parse('$baseUrl/posts/1'));
  }
}
