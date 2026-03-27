import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> todo = [];
  TextEditingController controller = TextEditingController();
  bool showInput = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black54,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontFamily: "great"),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "TO-DO",
            style: TextStyle(
              fontFamily: "great",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        Text(
                          todo[index],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_forever, color: Colors.red),
                          onPressed: () => setState(() => todo.removeAt(index)),
                        ),
                      ],
                    ),
                    itemCount: todo.length,
                  ),
                ),
                showInput
                    ? Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: controller,
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                todo.add(value);
                                controller.clear();
                                showInput = false;
                              });
                            } else {
                              setState(() {
                                showInput = true;
                              });
                            }
                          },
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            hintText: "Add a new task",
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: 60,
                      ),
                      onPressed: () {
                        setState(() {
                          controller.clear();
                          showInput = !showInput;
                          print(todo);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
