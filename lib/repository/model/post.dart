import 'package:equatable/equatable.dart';
import 'package:flutter_ci_test/data/remote/model/remote_post.dart';

class Post extends Equatable {
  const Post(this.id, this.userId, this.title, this.body);

  final int id;
  final int userId;
  final String title;
  final String body;

  @override
  List<Object?> get props => [id, userId, title, body];

  RemotePost toRemote() => RemotePost(id, userId, title, body);

  Post.fromRemote(RemotePost post)
      : id = post.id,
        userId = post.userId,
        title = post.title,
        body = post.body;
}
