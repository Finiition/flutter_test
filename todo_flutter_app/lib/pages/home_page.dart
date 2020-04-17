import 'package:flutter/material.dart';
import 'package:todoflutterapp/domains/task_domain.dart';
import 'package:todoflutterapp/domains/type_task_domain.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskDomain> tasks = [
    TaskDomain(Icons.insert_drive_file, 'All', '150 tasks'),
    TaskDomain(Icons.work, 'Work', '25 tasks'),
    TaskDomain(Icons.library_music, 'Music', '10 tasks'),
    TaskDomain(Icons.card_travel, 'Travel', '25 tasks')
  ];

  List<TypeTaskDomain> typesTask = [
    TypeTaskDomain(Icons.insert_drive_file, 'All'),
    TypeTaskDomain(Icons.work, 'Work'),
    TypeTaskDomain(Icons.library_music, 'Music'),
    TypeTaskDomain(Icons.card_travel, 'Travel')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lists',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(child: _buildBody()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('button add pressed');
        },
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        itemCount: typesTask.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, position) {
          return GestureDetector(
            onTapUp: (details) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(tasks[position], typesTask[position]);
              }));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: <Widget>[
                    Icon(
                      typesTask[position].iconType,
                      size: 45,
                      color: Colors.black,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(tasks[position].titre,
                                      style: TextStyle(fontSize: 22)),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    tasks[position].subTitle,
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.blueGrey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
