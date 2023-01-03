import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/state.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  Future todosRefresh() {
    state = [];

    return Future.delayed(const Duration(milliseconds: 500), todosFetch);
  }

  Future todosFetch() {
    Future result =
        todosApi.todosList().then((todos) => state = todos as List<Todo>);

    return result;
  }

  Future<void> todoCreate(String content) async {
    // create API request
    final newTodo = await todosApi.todosCreate(Todo(
      id: 0,
      content: content,
      isCompleted: false,
    )) as Todo;

    state = [...state, newTodo];
  }

  Future<bool> todoDelete(int todoId) async {
    // create API request
    await todosApi.todosDestroy(todoId);

    // update local state
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];

    return true;
  }

  Future<void> todoToggleIsCompleted(int todoId) async {
    // create new todo with updated completion status
    Todo modifiedTodo = state.where((todo) => todo.id == todoId).toList()[0];
    modifiedTodo.isCompleted = !(modifiedTodo.isCompleted as bool);

    // create API request
    Todo updatedTodo =
        await todosApi.todosUpdate(modifiedTodo.id, modifiedTodo) as Todo;

    // update local state
    state = [
      for (final todo in state)
        if (todo.id == todoId) updatedTodo else todo,
    ];
  }

  Future<void> todoUpdateContent(int todoId, String content) async {
    // create new todo with updated content
    Todo modifiedTodo = state.where((todo) => todo.id == todoId).toList()[0];
    modifiedTodo.content = content;

    // create API request
    Todo updatedTodo =
        await todosApi.todosUpdate(modifiedTodo.id, modifiedTodo) as Todo;

    // update local state
    state = [
      for (final todo in state)
        if (todo.id == todoId) updatedTodo else todo,
    ];
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class TodoSelectedIdNotifier extends StateNotifier<int> {
  TodoSelectedIdNotifier() : super(0);

  void reset() => state = 0;

  void update(int todoId) {
    if (state != todoId) {
      state = todoId;
    } else {
      state = 0;
    }
  }
}

final todoSelectedIdProvider =
    StateNotifierProvider<TodoSelectedIdNotifier, int>((ref) {
  return TodoSelectedIdNotifier();
});
