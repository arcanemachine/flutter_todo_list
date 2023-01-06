import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/stores.dart';
import 'package:flutter_todo_list/todos/stores.dart';
import 'package:flutter_todo_list/widgets.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: baseWidgets.appBar(
        context,
        ref,
        title: "Todo List",
        hideBackButton: true,
      ),
      body: _refreshIndicator(context, ref),
    );
  }

  Widget _refreshIndicator(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: ref.read(todosProvider.notifier).refresh,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: Column(
        children: [
          Expanded(
            child: _futureBuilder(context, ref),
          ),
        ],
      ),
    );
  }

  Widget _futureBuilder(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(todosProvider.notifier).fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _futureSuccess(context, ref);
        } else if (!snapshot.hasError) {
          return _futureLoading(context);
        } else {
          return _futureError(context);
        }
      },
    );
  }

  Widget _futureLoading(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
        SizedBox(height: 16.0),
        Center(
          child: Text("Loading data..."),
        ),
      ],
    );
  }

  Widget _futureError(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Error: Could not retrieve data from the server.",
          ),
          const SizedBox.square(dimension: 16.0),
          ElevatedButton(
            onPressed: () {
              context.pushReplacementNamed("todos:todos");
            },
            child: const Text("Try again"),
          )
        ],
      ),
    );
  }

  Widget _futureSuccess(BuildContext context, WidgetRef ref) {
    return _todoListContainer();
  }

  Widget _todoListContainer() {
    return Column(
      children: const <Widget>[
        TodoForm(),
        SizedBox(height: 16.0),
        Expanded(
          child: TodoList(),
        ),
      ],
    );
  }
}

class TodoForm extends ConsumerWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final textInputController = TextEditingController();
    final int? todoSelectedId = ref.watch(todoSelectedIdProvider);

    // when updating todo, assign input field value to todo content
    if (todoSelectedId != 0) {
      textInputController.text = ref
          .read(todosProvider)
          .where((todo) => todo.id == todoSelectedId)
          .toList()[0]
          .content;
    }

    void handleSubmit() {
      if (formKey.currentState!.validate()) {
        final String content = textInputController.text;

        if (todoSelectedId == 0) {
          // create todo
          ref.read(todosProvider.notifier).create(content).then((res) {
            // success message
            widgetHelpers.snackBarShow(context, "Todo created");
          }).catchError((err) {
            // show message
            widgetHelpers.snackBarShow(context, "Could not create todo");
          });
        } else {
          // update todo content
          ref
              .read(todosProvider.notifier)
              .updateContent(todoSelectedId, content)
              .then((res) {
            // show message
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Todo content updated")),
            );

            // reset selected todo
            ref.read(todoSelectedIdProvider.notifier).reset();
          });
        }

        textInputController.clear(); // clear text input field
      }
    }

    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
            // text input field
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: textInputController,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: "${todoSelectedId == 0 ? 'Add' : 'Modify'} todo...",
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'This field cannot be empty.';
                }
                return null;
              },
              onFieldSubmitted: (_) => handleSubmit(),
            ),
          ),
          Center(
            // submit button
            child: ElevatedButton(
              onPressed: () => handleSubmit(),
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoList extends ConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  void _toggleIsCompleted(BuildContext context, WidgetRef ref, Todo todo) {
    ref.read(isLoadingProvider.notifier).state = true;

    ref.read(todosProvider.notifier).toggleIsCompleted(todo.id).then((res) {
      // success message
      widgetHelpers.snackBarShow(context, "Todo status updated");
    }).catchError((error) {
      // error message
      widgetHelpers.snackBarShow(context, "Could not update todo status");
    }).whenComplete(() {
      ref.read(isLoadingProvider.notifier).state = false;
    });
  }

  // widgets
  Widget checkmarkIcon(BuildContext context, WidgetRef ref, Todo todo) {
    return IconButton(
      icon: const Icon(Icons.check),
      color: todo.isCompleted == true ? Colors.green : null,
      tooltip: "Mark complete",
      onPressed: () => _toggleIsCompleted(context, ref, todo),
    );
  }

  Widget deleteIcon(BuildContext context, WidgetRef ref, Todo todo) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: Colors.red,
      tooltip: "Delete todo",
      onPressed: () {
        // delete todo
        ref.read(todosProvider.notifier).delete(todo.id).then((res) {
          // show message
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Todo deleted")));

          // reset selected todo ID
          ref.read(todoSelectedIdProvider.notifier).reset();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);
    int? todoSelectedId = ref.watch(todoSelectedIdProvider);

    Widget todosEmptyText() {
      return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          SizedBox(height: 16.0),
          Center(
            child: Text("No todos created..."),
          ),
        ],
      );
    }

    Widget todoList() {
      Widget todoListTile(Todo todo) {
        return ListTile(
          title: TextButton(
            style: TextButton.styleFrom(
              foregroundColor:
                  todo.isCompleted == true ? Colors.green : Colors.black,
              backgroundColor: todo.id == ref.read(todoSelectedIdProvider)
                  ? Colors.blue[100]
                  : null,
              alignment: Alignment.centerLeft,
            ),
            child: Text(todo.content),
            onPressed: () {
              ref.read(todoSelectedIdProvider.notifier).update(todo.id as int);
            },
          ),
          trailing: todoSelectedId != todo.id
              ? checkmarkIcon(context, ref, todo)
              : deleteIcon(context, ref, todo),
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int i) {
          Todo todo = todos[i];

          return todoListTile(todo);
        },
      );
    }

    return todos.isEmpty ? todosEmptyText() : todoList();
  }
}
