import 'package:equatable/equatable.dart';

abstract class PostApiEvent extends Equatable {
  const PostApiEvent();
  @override
  List<Object> get props => [];
}

class FetchPostApiEvent extends PostApiEvent {}

class SearchPostApiEvent extends PostApiEvent {
  final String search;
  const SearchPostApiEvent(this.search);
  @override
  List<Object> get props => [search];
}
