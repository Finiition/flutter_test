import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImagePage extends StatefulWidget {
  @override
  _CachedImagePageState createState() => _CachedImagePageState();
}

class _CachedImagePageState extends State<CachedImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cached Image'),
        centerTitle: true,
      ),
      body: Center(
        // Faire un cercle qui prend tout l'espace
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child: Container(
              height: 100,
              width: 100,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: CachedNetworkImage(
                imageUrl: 'https://i.imgflip.com/amuvy.jpg',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
