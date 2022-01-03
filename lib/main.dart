/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Organizer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Exam Organizer', exams: ["Exam"], dates: [DateTime.parse("1969-07-20 20:18:04Z")],),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title, required this.exams, required this.dates}) : super(key: key);

  final String title;
  List<String> exams;
  List<DateTime> dates;

  void _addExam() {
    exams.add("New Exam");
    dates.add(DateTime.parse("1969-07-20 20:18:04Z"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _addExam();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (contx, index) {
          print(exams[index]);
          return Card(
            elevation: 5,
            child: Container (
              margin: EdgeInsets.all(10),
              //decoration: BoxDecoration(border: Border.all(color: Theme.of(contx).primaryColor, width: 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(exams[index],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(contx).primaryColorLight)),
                  Text(dates[index].toString(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey))
                ],
              ),
             )
          );
        },
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> exams = <String>[];
  final List<DateTime> dates = <DateTime>[];

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void addItemToList(){
    setState(() {
      exams.insert(0,nameController.text);
      var date = DateTime.parse(dateController.text);
      dates.insert(0, date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exam Organizer'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addItemToList();
              },
            )
          ],
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Exam Title',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date',
                  ),
                ),
              ),
              Text("Please insert date and time in the following format: \nYYYY-MM-DD HH:HH\n"),
              Expanded(
                  child: ListView.builder(
                    itemCount: exams.length,
                    itemBuilder: (contx, index) {
                      print(exams[index]);
                      return Card(
                          elevation: 5,
                          child: Container (
                            margin: EdgeInsets.all(10),
                            //decoration: BoxDecoration(border: Border.all(color: Theme.of(contx).primaryColor, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(exams[index],
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(contx).primaryColorLight)),
                                Text(dates[index].toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.grey))
                              ],
                            ),
                          )
                      );
                    },
                  )
              )
            ]
        )
    );
  }
}