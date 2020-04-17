import 'dart:io';

import 'package:discorverflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  String _urlImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image picker'),
        actions: <Widget>[
          Platform.isIOS
              ? IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _showPopUp,
                )
              : Container()
        ],
      ),
      body: Container(
        decoration: _urlImage == ''
            ? BoxDecoration()
            : BoxDecoration(
                image: DecorationImage(image: AssetImage(_urlImage))),
        child: _buildBody(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showPopUp,
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        itemCount: MyApp.images.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.file(
                  MyApp.images[position],
                  fit: BoxFit.cover,
                )),
                Positioned(
                  right: -4,
                  top: -4,
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        MyApp.images.removeAt(position);
                      });
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              MyApp.images[position].path.split("/").last,
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  _showPopUp() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Image source'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  child: Text('Camera', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    _openPicker(ImageSource.camera);
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                ),
                FlatButton(
                  color: Colors.red,
                  child: Text('Gallery', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    _openPicker(ImageSource.gallery);
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                )
              ],
            ),
          );
        });
  }

  _openPicker(ImageSource imageSource) async {
    print('addImagePressed');
    File image = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      MyApp.images.add(image);
    });

//    print('image ' + image.path);
  }
}
