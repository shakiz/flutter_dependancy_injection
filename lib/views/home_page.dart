import 'package:flutter/material.dart';
import 'package:flutter_dependancy_injection/domains/controllers/meme_controller.dart';
import 'package:flutter_dependancy_injection/domains/models/meme.dart';

import '../locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
  Meme? visibleMeme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: visibleMeme != null
            ? Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Category ${visibleMeme!.category}",
                    style: const TextStyle(fontSize: 36),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.network(visibleMeme!.imageUrl),
                  ),
                  const SizedBox(height: 8),
                  Text("Caption: ${visibleMeme!.caption}"),
                ],
              ),
            ),
          ),
        )
            : const Center(child: Text("No Meme loaded yet")),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
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