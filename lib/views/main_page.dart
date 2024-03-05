import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(8),
            child: FloatingActionButton(
              tooltip: "info",
              onPressed: () {},
              child: const Icon(
                Icons.help_outline_sharp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
