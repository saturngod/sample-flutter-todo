import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "Todo.dart";
import "DetailScreen.dart";

class ListTodo extends StatelessWidget {
  final List<Todo> todos;

  ListTodo({Key key, @required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(this.todos[index].title),
          subtitle: Text(this.todos[index].description),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: this.todos[index])),
            );
          },
        );
      },
    );
  }
}

class TodoScreen extends StatelessWidget {
  final List<Todo> todos;

  final titleController = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  TodoScreen({Key key, @required this.todos}) : super(key: key);

  void addInNewTodo(title,text) {
    this.todos.insert(0, Todo(title, text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todos"),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      autofocus: true,
                      
                      controller: titleController,
                      decoration: InputDecoration(hintText: "Title"),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (text) {
                          FocusScope.of(context).requestFocus(myFocusNode);
                      }
                      
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      autofocus: true,
                      focusNode: myFocusNode,
                      decoration: InputDecoration(hintText: "Description"),
                      onSubmitted: (text) {
                        addInNewTodo(titleController.text,text);
                        FocusScope.of(context).requestFocus(FocusNode());
                       
                      },
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListTodo(
                todos: this.todos,
              )),
            ])));
  }
}
