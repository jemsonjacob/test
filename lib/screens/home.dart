import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showChatDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ChatBot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ask me anything!'),
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Type your message...'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // ignore: unused_local_variable
                String message = controller.text;

                Navigator.of(context).pop(); // Close
              },
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), automaticallyImplyLeading: false),
      body: Center(child: Text('Home Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showChatDialog(context),
        child: Icon(Icons.chat),
      ),
    );
  }
}
