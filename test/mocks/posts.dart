import 'package:flutter_challenge_pinapp/domain/post.dart';

final mockJsonPosts = [
  {
    'id': 1,
    'userId': 1,
    'title': 'Post 1',
    'body': 'This is the body of post 1',
  },
  {
    'id': 2,
    'userId': 1,
    'title': 'Post 2',
    'body': 'This is the body of post 2',
  },
  {
    'id': 3,
    'userId': 1,
    'title': 'Post 3',
    'body': 'This is the body of post 3',
  },
];

final mockPosts = [
  Post(
    id: 1,
    userId: 1,
    title: 'Post 1',
    body: 'This is the body of post 1',
  ),
  Post(
    id: 2,
    userId: 1,
    title: 'Post 2',
    body: 'This is the body of post 2',
  ),
  Post(
    id: 3,
    userId: 1,
    title: 'Post 3',
    body: 'This is the body of post 3',
  ),
];
