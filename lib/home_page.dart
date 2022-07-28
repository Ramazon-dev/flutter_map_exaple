import 'package:flutter/material.dart';
import 'package:flutter_map_example/flutter_maps_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FlutterMapsPage(),
              ),
            );
          },
          child: const Text(
            "Flutter Map",
          ),
        ),
      ),
    );
  }
}
