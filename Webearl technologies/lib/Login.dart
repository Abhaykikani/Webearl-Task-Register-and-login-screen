import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginpagState extends StatefulWidget {
  const LoginpagState({super.key});

  @override
  State<LoginpagState> createState() => _LoginpagStateState();
}

class _LoginpagStateState extends State<LoginpagState> {
  TextEditingController contactcontrollers = TextEditingController();
  TextEditingController passwordcontrollers = TextEditingController();

  final String url = 'http://3.108.65.195:3000/api/diagnostic_partner/login';

  Future<void> Login() async {
    print("================url${url}");
    var response = await http.post(Uri.parse(url),
        body: jsonEncode({
          'contact': contactcontrollers.text,
          'password': passwordcontrollers.text,
        }),
        headers: <String, String>{'Content-Type': 'application/json'});
    // print("===============body  : ${Body}");
    if (response.statusCode == 200) {
      print("Login successfully");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login successfully")));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const profilepage()));
    } else {
      print("Login fail");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login fail")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Login page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: contactcontrollers,
              decoration: InputDecoration(
                hintText: 'Contact',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: passwordcontrollers,
              decoration: InputDecoration(
                hintText: 'Enter password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Login();
            },
            child: Text("login "),
          )
        ],
      ),
    );
  }
}
