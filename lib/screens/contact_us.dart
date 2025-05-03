import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        automaticallyImplyLeading: false,
      ),
      //backgroundColor: const Color.fromARGB(255, 208, 185, 243),
      body: SafeArea(
        child: Center(
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Email'),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,

                        validator:
                            (value) =>
                                value != null && value.contains('@')
                                    ? null
                                    : 'Enter a valid email id',
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Name'),
                        controller: _nameController,
                        validator:
                            (value) =>
                                value != null && value.isEmpty
                                    ? 'Enter a valid name'
                                    : null,
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Subject'),
                        controller: _subjectController,
                        validator:
                            (value) =>
                                value != null && value.isEmpty
                                    ? 'Enter a valid subject'
                                    : null,
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Message'),
                        controller: _messageController,
                        validator:
                            (value) =>
                                value != null && value.isEmpty
                                    ? 'Enter a valid Message'
                                    : null,
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Your request has been send'),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please fill the form'),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
