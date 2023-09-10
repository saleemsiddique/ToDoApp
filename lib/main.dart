import 'package:flutter/material.dart';

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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => createTaskScreen()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.black,
            child: Center(child: Text('Entry')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class createTaskScreen extends StatelessWidget {
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
                decoration: InputDecoration(
                  labelText: "Name of Task",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
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
                  Navigator.pop(context);
                }, 
                child: Text("Submit"),
              ),
            )
            // You can add more text fields here if needed
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
