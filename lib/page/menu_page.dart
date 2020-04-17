import 'package:discorverflutter/page/calculatrice_page.dart';
import 'package:discorverflutter/page/dart_async_page.dart';
import 'package:discorverflutter/page/ex1_page.dart';
import 'package:discorverflutter/page/ex2_page.dart';
import 'package:discorverflutter/page/hello_page.dart';
import 'package:discorverflutter/page/hero_page.dart';
import 'package:discorverflutter/page/pass_data_main_page.dart';
import 'package:discorverflutter/page/random_cat_page.dart';
import 'package:discorverflutter/page/stream_listener_page.dart';
import 'package:discorverflutter/widget/dbutton_widget.dart';
import 'package:flutter/material.dart';

import 'cached_image_page.dart';
import 'image_picker_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me and the Boys'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              print('Account AppBar refresh');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              print('Account Icon AppBar pressed');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('graphics/cat2.png'))),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Hero(
                      tag: 'welcome',
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('graphics/cat.jpg'))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('graphics/cat3.png'))),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            // Alignement en bas de la colonne
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 25,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        // Aligne le contenue de la colonne au container
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          DButtonWidget(1, 'Calculatrice', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CalculatricePage();
                            }));
                          }, Colors.purple),
                          DButtonWidget(2, 'Exercice 1', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Exercice1();
                            }));
                          }, Colors.deepPurple),
                          DButtonWidget(3, 'Exercice 2', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Exercice2();
                            }));
                          }, Colors.blueAccent),
                          DButtonWidget(4, 'Hello flutter', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HelloPage();
                            }));
                          }, Colors.greenAccent),
                          DButtonWidget(5, 'Dart Async/Future', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DartAsyncPage();
                            }));
                          }, Colors.green),
                          DButtonWidget(6, 'Cache network Image', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CachedImagePage();
                            }));
                          }, Colors.yellow),
                          DButtonWidget(7, 'Random cat', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RandomCatPage();
                            }));
                          }, Colors.orange),
                          DButtonWidget(8, 'Hero Animation', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HeroPage();
                            }));
                          }, Colors.redAccent),
                          DButtonWidget(9, 'Pass data between pages', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PassDataMainPage();
                            }));
                          }, Colors.red),
                          DButtonWidget(10, 'Image Picker', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ImagePickerPage();
                            }));
                          }, Colors.black),
                          DButtonWidget(10, 'Stream', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return StreamListenerPage();
                            }));
                          }, Colors.black),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
