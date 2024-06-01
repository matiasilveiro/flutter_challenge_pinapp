import 'package:flutter_challenge_pinapp/domain/comment.dart';

final mockJsonComments = [
  {
    'id': 1,
    'postId': 1,
    'name': 'Name 1',
    'email': 'email1@gmail.com',
    'body': 'Comment 1 for post 1',
  },
  {
    'id': 2,
    'postId': 1,
    'name': 'Name 2',
    'email': 'email2@gmail.com',
    'body': 'Comment 2 for post 1',
  },
  {
    'id': 3,
    'postId': 1,
    'name': 'Name 3',
    'email': 'email3@gmail.com',
    'body': 'Comment 3 for post 1',
  },
];

final mockComments = [
  Comment(
    id: 1,
    postId: 1,
    name: 'Name 1',
    email: 'email1@gmail.com',
    body: 'Comment 1 for post 1',
  ),
  Comment(
    id: 2,
    postId: 1,
    name: 'Name 2',
    email: 'email1@gmail.com',
    body: 'Comment 2 for post 1',
  ),
  Comment(
    id: 3,
    postId: 1,
    name: 'Name 3',
    email: 'email1@gmail.com',
    body: 'Comment 3 for post 1',
  ),
];
