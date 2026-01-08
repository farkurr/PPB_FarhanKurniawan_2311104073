import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomeScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unguided REST API")),
      body: Column(
        children: [
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: controller.getPosts,
                child: Text("GET"),
              ),
              ElevatedButton(
                onPressed: controller.addPost,
                child: Text("POST"),
              ),
              ElevatedButton(
                onPressed: controller.updatePost,
                child: Text("PUT"),
              ),
              ElevatedButton(
                onPressed: controller.deletePost,
                child: Text("DELETE"),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(controller.posts[index]['title'] ?? ''),
                      subtitle: Text(controller.posts[index]['body'] ?? ''),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
