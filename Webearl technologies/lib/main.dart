import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registerscreen(),
    ),
  );
}

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController contactpersoncontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final String url = 'http://3.108.65.195:3000/api/diagnostic_partner';

  Future<void> register() async {
    print("================url${url}");
    var response = await http.post(Uri.parse(url),
        body: jsonEncode({
          'company_name': companynamecontroller.text,
          'email': emailcontroller.text,
          'city': citycontroller.text,
          'pincode': pincodecontroller.text,
          'address': addresscontroller.text,
          'contact_person': contactpersoncontroller.text,
          'contact': contactcontroller.text,
          'password': passwordcontroller.text,
        }),
        headers: <String, String>{'Content-Type': 'application/json'});
    // print("===============body  : ${Body}");
    if (response.statusCode == 200) {
      print("Register successfully");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Register successfully")));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginpagState()));
    } else {
      print("Register fail");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Register fail")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Register screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: companynamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Company name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter company name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email id',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: citycontroller,
                  decoration: InputDecoration(
                    hintText: 'City name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter city name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: pincodecontroller,
                  decoration: InputDecoration(
                    hintText: 'Pincode',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter pincode';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: contactpersoncontroller,
                  decoration: InputDecoration(
                    hintText: 'Contact Person',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter contact person';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: contactcontroller,
                  decoration: InputDecoration(
                    hintText: 'Contact',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter contact';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    register();
                  }
                },
                child: const Text("Registration"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
