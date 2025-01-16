import 'package:bloc_clean_code/bloc/post/post_api_bloc.dart';
import 'package:bloc_clean_code/bloc/post/post_api_state.dart';
import 'package:bloc_clean_code/repo/post_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post/post_api_event.dart';
import '../../utils/enums.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<PostApiBloc>().add(FetchPostApiEvent());
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post App'),
      ),
      body: BlocBuilder<PostApiBloc, PostApiState>(
        builder: (context, state) {
          return FutureBuilder(
            future: PostAPIRepo().fetchPost(),
            builder: (context, snapshot) {
              switch (state.postStatus) {
                case PostStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case PostStatus.success:
                  return ListView.builder(
                    itemCount: state.postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          state.postList[index].name.toString(),
                        ),
                        subtitle: Text(
                          state.postList[index].email.toString(),
                        ),
                      );
                    },
                  );
                case PostStatus.error:
                  // TODO: Handle this case.
                  throw UnimplementedError();
              }
            },
          );
        },
      ),
    );
  }
}
