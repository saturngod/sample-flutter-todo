import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "Todo.dart";

class DetailScreen extends StatelessWidget {
  final Todo todo;

   // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(todo.title),),
    body: Padding(padding: EdgeInsets.all(16.0),
    child: Text(todo.description),
    ),
    );
  }
}