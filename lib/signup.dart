import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  void login(String email, lastName, firstName) async {
    try {
      Response response = await post(
          Uri.parse('http://shop.asmantiz.com/api/customers/auth/register'),
          body: {
            'email': email,
            'firstname': firstName,
            'lastname': lastName,
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('account created succefuly');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Émail'),
            ),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(hintText: 'FirstName'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(hintText: 'LastName'),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                login(
                    emailController.text.toString(),
                    firstNameController.text.toString(),
                    lastNameController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text('Login')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
