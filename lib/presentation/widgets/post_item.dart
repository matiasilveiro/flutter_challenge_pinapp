import 'package:flutter/material.dart';

import '../../domain/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.post,
    required this.onPostTap,
  });

  final Post post;
  final Function(Post) onPostTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        post.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        post.body,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => onPostTap(post),
    );
  }
}
