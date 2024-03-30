import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  List user = [];

  @override
  void initState() {
    super.initState();
    newdata();
  }

  Future newdata() async {
    final String url =
        'http://3.108.65.195:3000/api/diagnostic_partner/display_profile';
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        user = jsonDecode(response.body);
      });
    } else {
      print("Fail ? ${response.body}");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Profile page",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
