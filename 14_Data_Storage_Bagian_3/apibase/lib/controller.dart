import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "https://693bba50b762a4f15c3e0905.mockapi.io/pertemuan14";
  List<dynamic> post = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        print("Data berhasil diambil");
        post = json.decode(response.body);
        print("Response Body: ${response.body}");
        if (post.isNotEmpty) {
          print("First item: ${post[0]}");
        }
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  Future<void> postData(String name, String nim) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"name": name, "nim": nim}),
      );

      if (response.statusCode == 201) {
        print("Data dengan nama $name dan nim $nim berhasil dikirim");
      }
    } catch (e) {
      throw Exception("Failed to post data : $e");
    }
  }

  Future<void> updateData(String id, String name, String nim) async {
    try {
      final response = await http.put(
        Uri.parse("$baseUrl/$id"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"name": name, "nim": nim}),
      );

      if (response.statusCode == 200) {
        print("Data dengan nama $name dan nim $nim berhasil diubah");
      }
    } catch (e) {
      throw Exception("Failed to put data : $e");
    }
  }

  Future<void> deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse("$baseUrl/$id"));

      if (response.statusCode == 200) {
        print("Data dengan id $id berhasil dihapus");
      }
    } catch (e) {
      throw Exception("Failed to delete data: $e");
    }
  }
}
