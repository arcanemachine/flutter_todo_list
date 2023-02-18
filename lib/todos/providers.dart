import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/state.dart';

// todods
class TodosNotifier extends StateNotifier<List<Todo>> {
  /// StateNotifierProviders both expose a value directly, and also
  /// expose methods that allow you to manipulate the value.
  TodosNotifier() : super([]);

  Future refresh() {
    return fetch().then((value) => state = value);
  }

  Future fetch() async {
    final todosApi = todosApiCreate(await secureStorage.read('auth_token'));

    Future result =
        todosApi.todosList().then((todos) => state = todos as List<Todo>);

    return result;
  }

  Future<void> create(String content) async {
    final todosApi = todosApiCreate(await secureStorage.read('auth_token'));

    // create API request
    final newTodo = await todosApi.todosCreate(TodoRequest(
      content: content,
      isCompleted: false,
    )) as Todo;

    state = [...state, newTodo];
  }

  Future toggleIsCompleted(int? todoId) async {
    final todosApi = todosApiCreate(await secureStorage.read('auth_token'));

    // create new todo with updated completion status
    Todo todo = state.where((todo) => todo.id == todoId).toList()[0];
    TodoRequest todoRequest = TodoRequest(
      content: todo.content,
      isCompleted: !(todo.isCompleted as bool),
    );

    // create API request
    Todo updatedTodo =
        await todosApi.todosUpdate(todoId as int, todoRequest) as Todo;

    // update local state
    state = [
      for (final todo in state)
        if (todo.id == todoId) updatedTodo else todo,
    ];
  }

  Future<void> updateContent(int? todoId, String modifiedContent) async {
    final todosApi = todosApiCreate(await secureStorage.read('auth_token'));

    // create new todo with updated content
    Todo todo = state.where((todo) => todo.id == todoId).toList()[0];
    TodoRequest todoRequest =
        TodoRequest(content: modifiedContent, isCompleted: todo.isCompleted);

    // create API request
    Todo updatedTodo =
        await todosApi.todosUpdate(todoId as int, todoRequest) as Todo;

    // update local state
    state = [
      for (final todo in state)
        if (todo.id == todoId) updatedTodo else todo,
    ];
  }

  Future<bool> delete(int? todoId) async {
    final todosApi = todosApiCreate(await secureStorage.read('auth_token'));

    // create API request
    await todosApi.todosDestroy(todoId as int);

    // update local state
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];

    return true;
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

// selected todo ID
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
