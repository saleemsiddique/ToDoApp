import 'package:flutter/material.dart';

List<Task> tasks = [];
void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoListScreen(),
    );
  }
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreen createState() => _ToDoListScreen();
}

class _ToDoListScreen extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("To Do App"),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final newTask = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => createTaskScreen())   
                        );
              if (newTask != null) {
                setState(() {
                  tasks.add(newTask);
                });
              }        
                        
              },
              icon: Icon(Icons.add)),
              
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = tasks[index];
          return Dismissible(
        key: Key(task.name), // Debe ser único para cada elemento
        onDismissed: (direction) {
        setState(() {
          tasks.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tarea eliminada'),
          ),
        );
      },
      background: Container(
        color: Colors.red, // Color de fondo al deslizar
        alignment: Alignment.centerLeft,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Container( // Wrap the ListTile with a Container
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Apply border
          borderRadius: BorderRadius.circular(8.0), // Add border radius for a rounded look
        ),
      child: ListTile(
        
        title: Text(task.name),
        subtitle: Text(task.description),
      ),
    ));
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
)
    );
  }
}

class createTaskScreen extends StatefulWidget {
  @override
  _createTaskScreen createState() => _createTaskScreen();
}

class _createTaskScreen extends State<createTaskScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String newName = "";
  String newDescription = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("To Do App")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertically center the children
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name of Task",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _descriptionController,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Task at hand",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  newName = _nameController.text;
                  newDescription = _descriptionController.text;
                  final newTask = Task(newName, newDescription);
                  Navigator.pop(context, newTask);
                }, 
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class Task {
  late String name;
  late String description;

  Task(String name, String description) {
    this.name = name;
    this.description = description;
  }

  String get getName => name;
  String get getMatricula => description;

  set setName(String name) {
    this.name = name;
  }

  set setDescription(String description) {
    this.description = description;
  }

  void printTask() {
    print(name);
    print(description);
  }
}
