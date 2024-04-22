import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tarea_2/firebase_options.dart';
import 'package:tarea_2/controller/TaskController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyTodoListApp());
}

class Task {
  String name;
  bool isCompleted;

  Task(this.name, this.isCompleted);
}

class MyTodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tareas App',
      home: TodoListApp(),
    );
  }
}

class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<Task> tasks = [];
  List<Task> completedTasks = [];
  List<Task> deletedTasks = [];
  TaskController _controller = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Lista de Tareas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Tareas'),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return _buildTaskItem(tasks[index]);
              },
            ),
          ),
          Divider(),
          _buildSectionTitle('Tareas Completadas'),
          Expanded(
            child: ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return _buildTaskItem(completedTasks[index]);
              },
            ),
          ),
          Divider(),
          _buildSectionTitle('Papelera'),
          Expanded(
            child: ListView.builder(
              itemCount: deletedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(deletedTasks[index].name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      setState(() {
                        deletedTasks.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTaskItem(Task task) {
    return ListTile(
      title: Text(task.name),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          setState(() {
            task.isCompleted = value!;
            if (task.isCompleted) {
              tasks.remove(task);
              completedTasks.add(task);
              deletedTasks.remove(task);
            } else {
              completedTasks.remove(task);
              tasks.add(task);
              deletedTasks.remove(task);
            }
          });
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            tasks.remove(task);
            completedTasks.remove(task);
            deletedTasks.add(task);
          });
        },
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    String newTask = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Tarea'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(
              hintText: 'Ingrese la nueva tarea',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (newTask.isNotEmpty) {
                  // Agrega la tarea a Firebase
                  String id = await _controller.create({"title": newTask});
                  setState(() {
                    tasks.add(Task(newTask, false));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
