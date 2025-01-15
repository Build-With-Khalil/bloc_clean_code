import 'package:bloc_clean_code/model/PostsAPIModel.dart';
import 'package:bloc_clean_code/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostApiState extends Equatable {
  final List<PostsApiModel> postList;
  final PostStatus postStatus;
  final String message;

  const PostApiState({
    this.postList = const <PostsApiModel>[],
    this.postStatus = PostStatus.loading,
    this.message = "",
  });
  PostApiState copyWith({
    List<PostsApiModel>? postList,
    PostStatus? postStatus,
    String? message,
  }) {
    return PostApiState(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postList, postStatus, message];
}
