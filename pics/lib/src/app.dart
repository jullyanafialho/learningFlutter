import 'package:flutter/material.dart'; 
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import '../widgets/image_list.dart';
import 'dart:convert';
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter += 1;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    print('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);  
    });    
    print(imageModel.name);
    
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text('My First try with flutter'),
          centerTitle: false,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      )
    );
  }
}