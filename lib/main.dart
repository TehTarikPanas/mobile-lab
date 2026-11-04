import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[700],
        appBar: AppBar(
          title: const Text('My First Flutter Project'),
          centerTitle: true,
          backgroundColor: Colors.green[700],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 300,
                height: 300,
                image: NetworkImage(
                  'https://mllj2j8xvfl0.i.optimole.com/cb:c5QE.37290/w:713/h:476/q:mauto/dpr:1.3/f:best/https://themeisle.com/blog/wp-content/uploads/2018/07/uncompressed-jpeg.jpg',
                ),
              ),
              Text('This is my unknown flower'),
              SizedBox(height: 20),
              Image(
                width: 300,
                height: 300,
                image: AssetImage('assets/sun flower.jpg'),
              ),
              Text('This is my sunflower'),
            ],
          ),
        ),
      ),
    );
  }
}
