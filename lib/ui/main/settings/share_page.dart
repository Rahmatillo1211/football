import 'package:fantasy_football/widgets/container/container_widget.dart';
import 'package:flutter/material.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white10,
        title: const Text(
          "Do'stlarni taklif qilish",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        ContainerWithTriangleAndCopy(),
      ],
    );
  }
}
