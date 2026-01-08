import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/post_viewmodel.dart';

class HomeView extends StatelessWidget {
  final PostViewModel viewModel = Get.put(PostViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM - REST API")),
      body: Column(
        children: [
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(onPressed: viewModel.getPosts, child: Text("GET")),
              ElevatedButton(onPressed: viewModel.addPost, child: Text("POST")),
              ElevatedButton(
                onPressed: viewModel.updatePost,
                child: Text("PUT"),
              ),
              ElevatedButton(
                onPressed: viewModel.deletePost,
                child: Text("DELETE"),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              if (viewModel.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: viewModel.posts.length,
                itemBuilder: (context, index) {
                  final post = viewModel.posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
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
