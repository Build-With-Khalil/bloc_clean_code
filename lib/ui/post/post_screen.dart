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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PostApiBloc>().add(FetchPostApiEvent());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post App'),
      ),
      body: BlocBuilder<PostApiBloc, PostApiState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.error:
              return Center(
                child: Text(state.message),
              );
            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search with Id',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<PostApiBloc>().add(
                            SearchPostApiEvent(value),
                          );
                    },
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(
                            child: Text(
                              state.searchMessage.toString(),
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.temPostList.isEmpty
                                ? state.postList.length
                                : state.temPostList.length,
                            itemBuilder: (context, index) {
                              if (state.temPostList.isNotEmpty) {
                                return ListTile(
                                  title: Text(
                                    state.temPostList[index].email.toString(),
                                  ),
                                  subtitle: Text(
                                    state.temPostList[index].body.toString(),
                                  ),
                                );
                              } else {
                                return ListTile(
                                  title: Text(
                                    state.postList[index].email.toString(),
                                  ),
                                  subtitle: Text(
                                    state.postList[index].body.toString(),
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
