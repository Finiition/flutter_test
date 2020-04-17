import 'package:cached_network_image/cached_network_image.dart';
import 'package:discorverflutter/domains/cat_domain.dart';
import 'package:discorverflutter/rest/request_helper.dart';
import 'package:flutter/material.dart';

class RandomCatPage extends StatefulWidget {
  @override
  _RandomCatPageState createState() => _RandomCatPageState();
}

class _RandomCatPageState extends State<RandomCatPage> {
  CatDomain _catDomain;

  bool _isLoading = false;
  String _message = 'Nyaaaaa ?!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nyani !!?'),
        centerTitle: true,
      ),
      body: Center(
        child: _buildContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _refreshButton();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return _buildLoader();
    } else if (_catDomain == null) {
      return _buildMessage();
    }
    return _builImage();
  }

  Widget _builImage() {
    return Column(
      children: <Widget>[
        Text(_catDomain.name),
        Container(height: 16),
        Expanded(
          child: CachedNetworkImage(
            imageUrl: _catDomain.pathUrl,
            placeholder: (context, url) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              );
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(height: 70)
      ],
    );
  }

  Widget _buildMessage() {
    return Center(
      child: Text(_message,
          style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey)),
    );
  }

  Widget _buildLoader() {
    return CircularProgressIndicator();
  }

  _refreshButton() {
    print('refresh');

    setState(() {
      _isLoading = true;
    });
    RequestHelper.getRandomCat().then((catDomain) {
      setState(() {
        _catDomain = catDomain;
        _isLoading = false;
      });
    }).catchError((onError) {
      setState(() {
        _isLoading = false;
        _message = 'Cat Not Found : ' + onError.toString();
      });
    });
  }
}
