import 'package:flutter/material.dart';
import 'package:notepad/widgets/todo_model.dart';


class AddTODO extends StatefulWidget {
  final ToDo toDo;

  AddTODO({this.toDo});

  @override
  _AddTODOState createState() => _AddTODOState();
}

class _AddTODOState extends State<AddTODO> {
  final _titleMaxLines = 1;
  final _detailsMaxLines = 5;
  String _appBarTitle = 'Add a new ToDo';

  TextEditingController _titleControllerTODO = TextEditingController();
  TextEditingController _subtitleControllerTODO = TextEditingController();
  String _titleError;
  @override
  void initState() {
    super.initState();
    if (widget.toDo != null) {
      _appBarTitle = 'Edit your ToDo';
      _titleControllerTODO.text = widget.toDo.title;
      _subtitleControllerTODO.text = widget.toDo.subtitle;
    }
  }

  @override
  void dispose() {
    _titleControllerTODO.clear();
    _subtitleControllerTODO.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('$_appBarTitle')),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                Color(0xff5773a8),
                Color(0xff405173),
                Color(0xff2c374d)
              ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _titleControllerTODO,
                  maxLines: _titleMaxLines,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: TextStyle(),
                    errorText: _titleError,
                    hintText: "Title",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                    controller: _subtitleControllerTODO,
                    maxLines: _detailsMaxLines,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Add some details... (optional)",
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.save,
                      size: 38.0,
                      color: Colors.white70,
                    ),
                    onPressed: () => _create())
              ],
            ),
          ),
        ));
  }

   void _create() {
    var title = _titleControllerTODO.text.trim();
    var subtitle = _subtitleControllerTODO.text.trim();

    // ignore: unused_local_variable
    bool hasError = false;

    if (_titleControllerTODO.text.isEmpty) {
      setState(() {
        _titleError = 'Debes ingresar un titulo';
      });
      hasError = true;
    }

      var todo = ToDo(title: title, subtitle: subtitle);
      Navigator.of(context).pop(todo);
    }
  }
  


