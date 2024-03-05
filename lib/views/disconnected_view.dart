import 'package:flutter/material.dart';

class DisconnectedView extends StatelessWidget {
  const DisconnectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Connect"),
          ),
        ],
      ),
    );
  }
}
