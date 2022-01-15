import 'package:flutter/material.dart';
import 'package:flutter_dependancy_injection/domains/controllers/meme_controller.dart';
import 'package:flutter_dependancy_injection/domains/models/meme.dart';

import '../locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
  late Meme visibleMeme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: visibleMeme != null
            ? Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Category ${visibleMeme.category}",
                    style: TextStyle(fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.network(visibleMeme.imageUrl),
                  ),
                  SizedBox(height: 8),
                  Text("Caption: ${visibleMeme.caption}"),
                ],
              ),
            ),
          ),
        )
            : Center(child: Text("No Meme loaded yet")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () async {
          Meme meme = await getIt.get<MemeDomainController>().getNextMeme();

          setState(() {
            visibleMeme = meme;
          });
        },
      ),
    );
  }
}