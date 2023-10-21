import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Help {
  String title;
  bool isDone;

  Help({required this.title, this.isDone = false});
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Help> helps = [];
  TextEditingController taskController = TextEditingController();

  void addHelp() {
    String newHelp = taskController.text.trim();
    if (newHelp.isNotEmpty) {
      setState(() {
        helps.add(Help(title: newHelp));
        taskController.clear();
      });
    }
  }

  void removeHelp(int index) {
    setState(() {
      helps.removeAt(index);
    });
  }

  void toggleHelp(int index) {
    setState(() {
      helps[index].isDone = !helps[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pertemuan 5'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: helps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: helps[index].isDone,
                      onChanged: (bool? value) {
                        toggleHelp(index);
                      },
                    ),
                    title: Text(
                      helps[index].title,
                      style: TextStyle(
                        decoration: helps[index].isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        removeHelp(index);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        hintText: 'Input Text',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: addHelp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}