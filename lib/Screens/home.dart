import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../widget/todo_item.dart';
import '../model/todo.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text("All ToDos",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500)),
                      ),
                      for (ToDo todoo in todosList) TodoItem(todo: todoo),
                    ],
                  ),
                )
              ],
            )));
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBGColor,
        title: const Icon(
          Icons.menu,
          color: tdBlack,
        ));
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }
}
