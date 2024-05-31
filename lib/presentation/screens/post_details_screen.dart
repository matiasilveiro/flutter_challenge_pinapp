import 'package:flutter/material.dart';

class PostDetailsScreen extends StatefulWidget {
  static const name = 'PostDetailsScreen';

  const PostDetailsScreen({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post details'),
      ),
      body: Center(
        child: Text('Post details for post ${widget.postId}'),
      ),
    );
  }
}
