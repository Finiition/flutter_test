import 'package:flutter/material.dart';
import 'package:todoflutterapp/domains/task_domain.dart';
import 'package:todoflutterapp/domains/type_task_domain.dart';

class DetailPage extends StatefulWidget {
  TaskDomain task;
  TypeTaskDomain typeTask;

  @override
  _DetailPageState createState() => _DetailPageState();

  DetailPage(this.task, this.typeTask);
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.task.titre),
//      ),
//      body: _build(),
//    );
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blue,
            expandedHeight: 250.0,
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned(
                    left: 35,
                    bottom: 98,
                    child: Icon(
                      widget.task.iconType,
                      size: 60,
                      color: Colors.white,
                    )),
                Positioned(
                  left: 35,
                  bottom: 55,
                  child: Text(widget.task.titre,
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                ),
                Positioned(
                  left: 35,
                  bottom: 35,
                  child: Text(widget.task.subTitle,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                )
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'late',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Call Max',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '20:15 - April 29',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Container(color: Colors.purple),
                Container(color: Colors.green),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _build() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      widget.task.iconType,
                      size: 60,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(widget.task.titre,
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget.task.subTitle,
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//CustomScrollView(
//slivers: <Widget>[
//SliverAppBar(
//floating: true,
//pinned: true,
//snap: true,
//title: Text('SliverAppBar'),
//),
//SliverList(
//delegate: SliverChildListDelegate([
//_build(),
//]),
//)
//],
//);
