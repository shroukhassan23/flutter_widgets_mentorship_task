import 'package:flutter/material.dart';
import 'package:week2_widgets/tasks_list_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool redMatched = false;
  bool greenMatched = false;
  bool blueMatched = false;
  bool downloadRed = false;
  bool downloadgreen = false;
  bool downloadblue = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Physical PlayGround"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Draggable<String>(
                    data: "red",
                    childWhenDragging: Container(
                      //circle
                      //المكان اللي سحبت منه
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromARGB(109, 244, 67, 54),
                      ),
                    ),
                    feedback: Container(
                      width: 80,
                      height: 80,
                      //خلال السحب
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.red,
                      ),
                    ),
                    child: redMatched
                        ? Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color.fromARGB(118, 231, 77, 66),
                            ),
                          )
                        : Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Draggable<String>(
                    data: "green",
                    childWhenDragging: Container(
                      //circle
                      //المكان اللي سحبت منه
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromARGB(108, 111, 244, 54),
                      ),
                    ),
                    feedback: Container(
                      width: 80,
                      height: 80,
                      //خلال السحب
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.green,
                      ),
                    ),
                    child: greenMatched
                        ? Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color.fromARGB(118, 66, 231, 94),
                            ),
                          )
                        : Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.green,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Draggable<String>(
                    data: "blue",
                    childWhenDragging: Container(
                      //circle
                      //المكان اللي سحبت منه
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromARGB(108, 54, 171, 244),
                      ),
                    ),
                    feedback: Container(
                      width: 80,
                      height: 80,
                      //خلال السحب
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.blue,
                      ),
                    ),
                    child: blueMatched
                        ? Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color.fromARGB(108, 54, 171, 244),
                            ),
                          )
                        : Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.blue,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 200),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      //square before drag on it
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: redMatched
                            ? Colors.red
                            : Color.fromARGB(118, 231, 77, 66),
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: redMatched
                          ? Icon(Icons.check, color: Colors.white, size: 50)
                          : downloadRed
                          ? Icon(Icons.download, color: Colors.white, size: 50)
                          : null,
                    );
                  },
                  onWillAccept: (data) {
                    setState(() {
                      downloadRed = true;
                    });
                    return downloadRed;
                  },
                  onLeave: (data) {
                    setState(() {
                      downloadRed = false;
                    });
                  },
                  onAccept: (data) {
                    if (data == "red") {
                      setState(() {
                        redMatched = true;
                      });
                    } else {
                      setState(() {
                        downloadRed = false;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      //square before drag on it
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: greenMatched
                            ? Colors.green
                            : Color.fromARGB(118, 88, 231, 66),
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: greenMatched
                          ? Icon(Icons.check, color: Colors.white, size: 50)
                          : downloadgreen
                          ? Icon(Icons.download, color: Colors.white, size: 50)
                          : null,
                    );
                  },
                  onWillAccept: (data) {
                    setState(() {
                      downloadgreen = true;
                    });
                    return downloadgreen;
                  },
                  onLeave: (data) {
                    setState(() {
                      downloadgreen = false;
                    });
                  },
                  onAccept: (data) {
                    if (data == "green") {
                      setState(() {
                        greenMatched = true;
                      });
                    } else {
                      setState(() {
                        downloadgreen = false;
                      });
                    }
                  },
                ),
              ),
              DragTarget<String>(
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    //square before drag on it
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: blueMatched
                          ? Colors.blue
                          : Color.fromARGB(118, 66, 173, 231),
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: blueMatched
                        ? Icon(Icons.check, color: Colors.white, size: 50)
                        : downloadblue
                        ? Icon(Icons.download, color: Colors.white, size: 50)
                        : null,
                  );
                },
                onWillAccept: (data) {
                  setState(() {
                    downloadblue = true;
                  });
                  return downloadblue;
                },
                onLeave: (data) {
                  setState(() {
                    downloadblue = false;
                  });
                },
                onAccept: (data) {
                  if (data == "blue") {
                    setState(() {
                      blueMatched = true;
                    });
                  } else {
                    setState(() {
                      downloadblue = false;
                    });
                  }
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TasksListScreen();
                  },
                ),
              );
            },
            child: Text("tasks list"),
          ),
        ],
      ),
    );
  }
}
