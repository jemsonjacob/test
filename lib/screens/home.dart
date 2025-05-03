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
      backgroundColor: const Color.fromARGB(255, 208, 185, 243),
      appBar: AppBar(title: Text('Home'), automaticallyImplyLeading: false),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 300,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/logo.jpg',
                    width: 1500,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        Text(
                          ' Hexaarch\nWe provide end-to-end property management services for residential housing, apartment homes, furnished corporate housing.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showChatDialog(context),
        child: Icon(Icons.chat),
      ),
    );
  }
}
