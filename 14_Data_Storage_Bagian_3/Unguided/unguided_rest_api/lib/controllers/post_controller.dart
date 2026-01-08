import 'package:get/get.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  final ApiService apiService = ApiService();

  var posts = <dynamic>[].obs;
  var isLoading = false.obs;

  void getPosts() async {
    try {
      isLoading(true);
      posts.value = await apiService.fetchPosts();
      Get.snackbar("Sukses", "Data berhasil diambil");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void addPost() async {
    await apiService.createPost();
    Get.snackbar("Sukses", "Data berhasil ditambahkan");
  }

  void updatePost() async {
    await apiService.updatePost();
    Get.snackbar("Sukses", "Data berhasil diperbarui");
  }

  void deletePost() async {
    await apiService.deletePost();
    Get.snackbar("Sukses", "Data berhasil dihapus");
  }
}
