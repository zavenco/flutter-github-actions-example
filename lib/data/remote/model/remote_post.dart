import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_post.g.dart';

@JsonSerializable()
class RemotePost extends Equatable {
  const RemotePost(this.id, this.userId, this.title, this.body);

  final int id;
  final int userId;
  final String title;
  final String body;

  factory RemotePost.fromJson(Map<String, dynamic> json) => _$RemotePostFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePostToJson(this);

  @override
  List<Object?> get props => [id, userId, title, body];
}