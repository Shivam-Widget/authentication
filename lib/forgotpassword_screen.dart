import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({super.key});

  @override
  State<ForgotPassWordScreen> createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isvalid = false;

  String? validateEmail(String? value) {
    const pattern = '@';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'Please enter a valid email address'
        : null;
  }

  void onChange() {
    setState(() {
      _isvalid = _formKey.currentState!.validate();
    });
  }


  void postData() async {
    http.Response response = await http.post(
      Uri.parse(
          'https://fly-manager-dev-api.azurewebsites.net/api/Account/login'),
      headers: {
        'accept': '*/*',
        'Authorization': '',
        'Content-Type': 'application/json-patch+json',
      },
      body: jsonEncode(
        <String, String>{
          "email": emailController.text,
          "timeZone": "Asia/Kolkata",
          "deviceType": "string",
        },
      ),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      debugPrint('---- DecodeData ------> $decodedData');
      debugPrint('--- Status Code ----> ${response.statusCode}');
    } else {
      debugPrint('--- Bed Response ----> ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        toolbarHeight: 30,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          onChanged: () {
            onChange();
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF1E374F),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Text(
                  "Don't worry! Just fill in your email and we'll send a \nlink to reset your password.",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: _isvalid
                      ? () async {
                          if (_formKey.currentState!.validate()) {


                          }
                        }
                      : null,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: _isvalid
                          ? const Color(0xFF1E374F)
                          : Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Email me a recovery link',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}