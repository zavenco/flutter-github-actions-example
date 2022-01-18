import 'package:flutter_ci_test/data/remote/model/remote_post.dart';

abstract class RestClient {
  Future<List<RemotePost>> getPosts();

  Future<RemotePost> getPost(int id);
}