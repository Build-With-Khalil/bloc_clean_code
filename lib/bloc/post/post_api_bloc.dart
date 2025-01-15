import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/bloc/post/post_api_event.dart';
import 'package:bloc_clean_code/bloc/post/post_api_state.dart';
import 'package:bloc_clean_code/repo/post_api_repo.dart';

import '../../utils/enums.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  final PostAPIRepo postAPIRepo;
  PostApiBloc(this.postAPIRepo) : super(PostApiState()) {
    on<FetchPostApiEvent>(_onFetchPostAPI);
  }
  void _onFetchPostAPI(PostApiEvent event, Emitter<PostApiState> emit) async {
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
}
