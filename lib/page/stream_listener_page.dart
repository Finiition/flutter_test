import 'package:discorverflutter/stream/timer_stream_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreamListenerPage extends StatefulWidget {
  @override
  _StreamListenerPageState createState() => _StreamListenerPageState();
}

class _StreamListenerPageState extends State<StreamListenerPage> {
  List<String> _infosList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initStream();
  }

  @override
  void dispose() {
    _disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Text'),
        ),
        body: ListView.builder(
            controller: _scrollController,
            itemCount: _infosList.length,
            itemBuilder: (context, position) {
              return Container(
                color: position % 2 == 0
                    ? Colors.blueGrey.withOpacity(0.3)
                    : Colors.white,
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                        position.toString(),
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 16,
                      ),
                      Text(_infosList[position]),
                    ],
                  ),
                ),
              );
            }));
  }

  _initStream() {
    TimerStreamHelper.getSingelton().streamController.stream.listen((data) {
      if (data is String) {
        print('Here is the string data ' + data.toString());

        _infosList.add("String infos : " + data);
      } else if (data is int) {
        print('Here is the int data ' + data.toString());

        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(data);

        String formattedDate =
            DateFormat('dd-MM-yyyy - HH:mm:ss').format(dateTime);

        _infosList.add("Int infos : " + formattedDate.toString());
      }

      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);

      setState(() {});
    });
  }

  _disposeStream() {
    TimerStreamHelper.getSingelton().closeStreamController();
  }
}
