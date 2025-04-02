import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _emailController.text;
              final password = _passwordController.text;
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                if(mounted) Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}