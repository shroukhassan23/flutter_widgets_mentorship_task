import 'package:flutter/material.dart';
import 'package:week2_widgets/loading_animation.dart';

class TasksListScreen extends StatefulWidget {
  const TasksListScreen({super.key});

  @override
  State<TasksListScreen> createState() => _TasksListScreenState();
}

class _TasksListScreenState extends State<TasksListScreen> {
  List<String> tasks = ["task 1", "task2", "task3"];
  List<bool> isCompleted = [];

  @override
  void initState() {
    super.initState();
    isCompleted = List.generate(tasks.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoadingAnimation();
                },
              ),
            );
          },
          child: Text("dots"),
        ),
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) newIndex -= 1;

            final task = tasks.removeAt(oldIndex);
            final completed = isCompleted.removeAt(oldIndex);

            tasks.insert(newIndex, task);
            isCompleted.insert(newIndex, completed);
          });
        },
        children: [
          for (int index = 0; index < tasks.length; index++)
            Dismissible(
              key: ValueKey(tasks[index]), // مهم جدًا
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                return await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Confirm Delete"),
                      content: const Text(
                        "Are you sure you want to delete this task?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                final removedTask = tasks[index];
                final removedCompleted = isCompleted[index];
                final removedIndex = index;

                setState(() {
                  tasks.removeAt(index);
                  isCompleted.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Task deleted"),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        setState(() {
                          tasks.insert(removedIndex, removedTask);
                          isCompleted.insert(removedIndex, removedCompleted);
                        });
                      },
                    ),
                  ),
                );
              },
              child: ListTile(
                key: ValueKey("tile-$index"), // Key إضافي للـ ListTile نفسه
                leading: const Icon(Icons.list),
                title: Text(
                  tasks[index],
                  style: isCompleted[index]
                      ? const TextStyle(decoration: TextDecoration.lineThrough)
                      : null,
                ),
                trailing: Checkbox(
                  value: isCompleted[index],
                  onChanged: (value) {
                    setState(() {
                      isCompleted[index] = value ?? false;
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
