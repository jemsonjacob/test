import 'package:flutter/material.dart';
import 'package:testapp/screens/mainwidget.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailcontroller = TextEditingController();
  final passwordcontoller = TextEditingController();

  final verifyemail = 'test@gmail.com';
  final verifypwd = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 185, 243),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24),

          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator:
                      (value) =>
                          value != null && value.contains('@')
                              ? null
                              : 'Enter a valid email',
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordcontoller,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator:
                      (value) =>
                          value != null && value.length >= 6
                              ? null
                              : 'Password must be at least 6 characters',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (verifyemail == emailcontroller.text &&
                        verifypwd == passwordcontoller.text) {
                      // print("succces");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ScreenMainPage();
                          },
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Success'),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid Credentials'),
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

                  child: Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
