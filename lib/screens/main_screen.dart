import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mis_lab3_181010/models/exam.dart';
import 'package:mis_lab3_181010/screens/exam_calendar.dart';
import 'package:mis_lab3_181010/screens/exam_details.dart';
import 'package:nanoid/nanoid.dart';

class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  final String title = "Exam Organizer";

  List<Exam> _examItems = [
    Exam(id: nanoid(5), exam_title: "Business Processes", exam_date: DateTime.parse('2022-05-10 13:00')),
    Exam(id: nanoid(5), exam_title: "Big Data Models and Algorithms", exam_date: DateTime.parse('2022-06-11 09:00')),
    Exam(id: nanoid(5), exam_title: "Bioinformatics", exam_date: DateTime.parse('2022-04-13 11:00'))
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void addItemToList(){
    if (nameController.text.isEmpty)
    {
      return;
    }
    setState(() {
      Exam newItem = Exam(
        id: nanoid(5),
        exam_title: nameController.text,
        exam_date: DateTime.parse(dateController.text),
      );
      nameController.text = "";
      dateController.text = "";
      _examItems.add(newItem);
      Navigator.pop(context);
    });
  }

  void deleteItem(String id){
    setState(() {
      _examItems.removeWhere((element) => element.id == id);
    });
  }

  void ShowDetails(BuildContext context, Exam item){
    Navigator.of(context).pushNamed(
        ExamDetailScreen.routeName,
        arguments: item
    );
  }

  void ShowCalendar(BuildContext context, List<Exam> items){
    Navigator.of(context).pushNamed(
        CalendarScreen.routeName,
        arguments: items
    );
  }

  Widget createBody(){
    return Column(
      children: [
        Expanded(
            child: _examItems.isEmpty ?
            Center(child: Text(
                "No scheduled exams",
                style: const TextStyle(fontWeight: FontWeight.bold)
            )
              ,) :
            ListView.builder(
              itemCount: _examItems.length,
              itemBuilder: (context, index){
                print(_examItems[index]);
                return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      title: Text(
                          _examItems[index].exam_title,
                          style: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                      subtitle: Text(_examItems[index].exam_date.toString()),
                      onTap: () => ShowDetails(context, _examItems[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteItem(_examItems[index].id),
                      ),
                    )
                );
              },
            )
        ),

      ],
    );
  }

  PreferredSizeWidget createAppBar(){
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(onPressed: () {
          showDialog(context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20
                  ),
                  title: Row(
                    children: [
                      Text("Add an exam"),
                      Spacer(),
                      IconButton(onPressed: () {Navigator.pop(context);},
                          icon: Icon(Icons.cancel))
                    ],
                  ),
                  children: [
                    Divider(height: 5,indent: 5),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Class name",
                      ),
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        hintText: "Date and time (yyyy-mm-dd)",
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    Divider(height: 5,indent: 5),
                    Spacer(),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        child: Text("Add"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          addItemToList();
                        },
                      ),
                    )
                  ],
                );  });
        } ,
          icon: Icon(Icons.add, size: 35),
          padding: EdgeInsets.only(right: 40),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: createAppBar(),
      body: createBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ShowCalendar(context, _examItems),
        tooltip: 'Calendar',
        child: const Icon(Icons.calendar_today),
      ),
    );
  }

}