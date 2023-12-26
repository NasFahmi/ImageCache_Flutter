import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        // Adjust other theme properties as needed
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // URL of the image you want to load and cache
    String imageUrl = 'https://picsum.photos/seed/picsum/200/300';

    return Scaffold(
      appBar: AppBar(
        title: Text('Cached Network Image'),
      ),
      body: Center(
        child: Image(
          image: NetworkImage(imageUrl),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Accessing the cached image file
          final cache = DefaultCacheManager(); // Gives a Singleton instance
          final file = await cache.getSingleFile(imageUrl);

          // Use the cached file as needed
          print('Cached file path: ${file.path}');
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
}
