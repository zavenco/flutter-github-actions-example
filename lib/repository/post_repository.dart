import 'package:flutter_ci_test/common/rest_client/rest_client.dart';
import 'package:flutter_ci_test/repository/model/post.dart';

class PostRepository {
  final RestClient _restClient;

  const PostRepository({required RestClient restClient}) : _restClient = restClient;

  Future<List<Post>> getPosts() {
    return _restClient.getPosts().then((value) => value.map((e) => Post.fromRemote(e)).toList());
  }

  Future<Post> getPost(int id) {
    return _restClient.getPost(id).then((value) => Post.fromRemote(value));
  }
}