part of 'todo_bloc.dart';

class TodoState extends Equatable {
  /// List of todos
  final List<String> todosList;

  /// Todo state
  const TodoState({
    this.todosList = const [],
  });
  TodoState copyWith({
    List<String>? todosList,
  }) {
    return TodoState(
      todosList: todosList ?? this.todosList,
    );
  }

  @override
  List<Object?> get props => [todosList];
}
