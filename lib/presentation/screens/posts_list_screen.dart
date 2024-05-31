import 'package:flutter/material.dart';

class PostsListScreen extends StatefulWidget {
  static const name = 'PostsListScreen';

  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const Center(
        child: Text('Posts list'),
      ),
    );
  }
}
