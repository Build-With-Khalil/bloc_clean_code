import 'package:bloc_clean_code/bloc/post/post_api_bloc.dart';
import 'package:bloc_clean_code/bloc/post/post_api_state.dart';
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
          return ListView.builder(
            itemCount: state.postList.length,
            itemBuilder: (context, index) {
              final postList = state.postList[index];
              switch (state.postStatus) {
                case PostStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case PostStatus.error:
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                case PostStatus.success:
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          postList.id.toString(),
                        ),
                      ),
                      title: Text(
                        postList.name.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        postList.body.toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
