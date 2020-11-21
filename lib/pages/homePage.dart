import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:notepad/pages/login_page.dart';
import 'package:notepad/widgets/todo_model.dart';
import 'package:notepad/widgets/todo_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_to_do.dart';

const String _todoskey = 'todos';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<ToDo> listToDo = [];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPreference) {
      var stringJson = sharedPreference.get(_todoskey);
      if (stringJson != null) {
        List<Map<String, dynamic>> list = json.decode(stringJson);
        setState(() {
          listToDo = list.map((e) => ToDo.fromJson(e)).toList();
        });
      }
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String title = 'MyNotes';
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.account_circle),
              )
            ],
          ),
          title: Text(
            title,
            style: TextStyle(letterSpacing: 5),
          ),
          backgroundColor: Color(0xff5773a8),
        ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    Color(0xff5773a8),
                    Color(0xff405173),
                    Color(0xff2c374d)
                  ])),
              child: ListView.builder(
                itemCount: listToDo.length,
                itemBuilder: (context, int index) {
                  return ToDoItem(
                    toDoItem: listToDo[index],
                    onDelete: () {
                      _confirmDelete(index);
                    },
                    onEdit: () {
                      _editToDo(index, listToDo[index]);
                    },
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    Color(0xff5773a8),
                    Color(0xff405173),
                    Color(0xff2c374d)
                  ])),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: ClipOval(
                        child: Image(
                            image:
                                AssetImage('assets/profile_picture_new.png')),
                      ),
                    ),
                  ),
                  TextField(
                    controller: TextEditingController(text: 'Manuela Castaño'),
                    textAlign: TextAlign.center,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        TextField(
                            controller: TextEditingController(text: 'ManuCG'),
                            readOnly: true,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.white70,
                            ))),
                        TextField(
                          controller: TextEditingController(
                              text: 'cgaviriamanu@gmail.com'),
                          readOnly: true,
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.alternate_email,
                                  color: Colors.white70)),
                        ),
                        TextField(
                          controller:
                              TextEditingController(text: '+57 300 4647058'),
                          readOnly: true,
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            prefixIcon:
                                Icon(Icons.phone, color: Colors.white70),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white,
                          size: 36.0,),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            _openCreateTodoPage();
          },
          child: Icon(
            Icons.playlist_add,
          ),
        ),
      ),
    );
  }

  void _openCreateTodoPage({ToDo todo}) {
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => AddTODO(toDo: todo),
    ))
        .then((value) {
      if (value != null) {
        _addTodoToList(value);
      }
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Borrar TODO'),
        content: Text("Estas seguro de eleiminar este todo?"),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar')),
          FlatButton(
            onPressed: () {
              _deleteToDo(index);
            },
            child: Text('Aceptar'),
          )
        ],
      ),
    );
  }

  void _deleteToDo(int index) {
    setState(() {
      listToDo.removeAt(index);
    });
    Navigator.pop(context);
    _saveInSharedPreferences(listToDo);
  }

  void _editToDo(int index, ToDo toDo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddTODO(
                  toDo: toDo,
                ))).then((toDoItem) {
      if (toDoItem != null) {
        setState(() {
          listToDo[index] = toDoItem;
        });
      }
    });
  }

  void _addTodoToList(ToDo todo) {
    setState(() {
      var index = listToDo.indexWhere((element) => element.id == todo.id);
      if (index == -1) {
        listToDo.add(todo);
      } else {
        listToDo[index] = todo;
        _saveInSharedPreferences(listToDo);
      }
    });
  }
}

void _saveInSharedPreferences(List<ToDo> listToDo) {
  var list = listToDo.map((e) => e.toJson()).toList();
  var stringJson = json.encode(list);
  SharedPreferences.getInstance().then((sharedPreferences) {
    sharedPreferences.setString(_todoskey, stringJson);
  });
}
