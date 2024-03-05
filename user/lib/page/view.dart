import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Hey"),
      ),
    );
  }
}
