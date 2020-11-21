import 'package:flutter/material.dart';
import 'package:notepad/widgets/todo_model.dart';

class ToDoItem extends StatefulWidget {
  final ToDo toDoItem;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  ToDoItem({
    @required this.toDoItem,
    @required this.onDelete,
    @required this.onEdit,
  });

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool checkBoxValue = false;
  Color currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onEdit,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 5.0
        ),
        child: Card(
          color: currentColor,
          child: ListTile(
            leading: Checkbox(
                activeColor: Colors.blue,
                value: checkBoxValue,
                onChanged: (bool value) => setState(() {
                      checkBoxValue = value;
                      if (checkBoxValue = value) {
                        currentColor = Colors.grey[300];
                      } else {
                        currentColor = Colors.white;
                      }
                    })),
            title: Text(widget.toDoItem.title),
            subtitle: Text(widget.toDoItem.subtitle),
            trailing: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: widget.onDelete,
            ),
          ),
        ),
      ),
    );
  }
}
