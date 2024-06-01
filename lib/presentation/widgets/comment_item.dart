import 'package:flutter/material.dart';

import '../../domain/comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: CircleAvatar(
        child: Text(comment.name[0].toUpperCase()),
      ),
      title: Text(comment.name),
      subtitle: Text(comment.body),
    );
  }
}
