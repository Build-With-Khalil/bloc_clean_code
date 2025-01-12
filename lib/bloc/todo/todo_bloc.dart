import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todosList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }
  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todosList.add(event.task);
    emit(
      state.copyWith(
        todosList: List.from(
          todosList,
        ),
      ),
    );
  }

  void _removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todosList.remove(event.task);
    emit(
      state.copyWith(
        todosList: List.from(
          todosList,
        ),
      ),
    );
  }
}
