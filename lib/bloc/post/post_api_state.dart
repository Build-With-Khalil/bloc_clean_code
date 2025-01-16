import 'package:bloc_clean_code/model/post_api_model.dart';
import 'package:bloc_clean_code/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostApiState extends Equatable {
  final List<PostsApiModel> postList;
  final List<PostsApiModel> temPostList;
  final PostStatus postStatus;
  final String message;
  final String searchMessage;

  const PostApiState({
    this.postList = const <PostsApiModel>[],
    this.temPostList = const <PostsApiModel>[],
    this.postStatus = PostStatus.loading,
    this.message = "",
    this.searchMessage = "",
  });
  PostApiState copyWith({
    List<PostsApiModel>? postList,
    List<PostsApiModel>? temPostList,
    PostStatus? postStatus,
    String? message,
    String? searchMessage,
  }) {
    return PostApiState(
      postList: postList ?? this.postList,
      temPostList: temPostList ?? this.temPostList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [
        postList,
        temPostList,
        postStatus,
        message,
        searchMessage,
      ];
}
