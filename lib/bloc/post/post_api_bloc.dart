import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/bloc/post/post_api_event.dart';
import 'package:bloc_clean_code/bloc/post/post_api_state.dart';
import 'package:bloc_clean_code/model/post_api_model.dart';
import 'package:bloc_clean_code/repo/post_api_repo.dart';

import '../../utils/enums.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  final List<PostsApiModel> postList = [];
  final PostAPIRepo postAPIRepo;
  PostApiBloc(this.postAPIRepo) : super(PostApiState()) {
    on<FetchPostApiEvent>(_onFetchPostAPI);
    on<SearchPostApiEvent>(_filterPost);
  }
  Future<void> _onFetchPostAPI(
      PostApiEvent event, Emitter<PostApiState> emit) async {
    await postAPIRepo.fetchPost().then(
      (value) {
        emit(
          state.copyWith(
            postList: value,
            postStatus: PostStatus.success,
            message: "Success",
          ),
        );
      },
    ).onError(
      (error, stackTrace) {
        emit(
          state.copyWith(
            postStatus: PostStatus.error,
            message: error.toString(),
          ),
        );
      },
    );
  }

  void _filterPost(SearchPostApiEvent event, Emitter<PostApiState> emit) {
    if (event.search.isEmpty) {
      emit(
        state.copyWith(
          temPostList: [],
          searchMessage: "Search is empty",
        ),
      );
    } else {
      final tempPostList = state.postList
          .where(
            (element) =>
                element.email.toString().toLowerCase().contains(event.search),
          )
          .toList();
      if (tempPostList.isEmpty) {
        emit(
          state.copyWith(
            temPostList: [],
            searchMessage: "No data found",
          ),
        );
      } else {
        emit(
          state.copyWith(
            temPostList: tempPostList,
            searchMessage: "",
          ),
        );
      }
    }
  }
}
