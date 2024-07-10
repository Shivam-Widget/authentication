import 'dart:convert';
import 'package:authentication/forgotpassword/forgotpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/login_model.dart';

final Uri _url = Uri.parse('https://dev.upflyte.com/Registration');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = false;
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

  accessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(GetAllData().accessToken!);
    if (token != null && token.isNotEmpty) {
      return 'Bearer $token';
    }
    return null;
  }

  void postData() async {
    http.Response response = await http.post(
      Uri.parse(
          'https://fly-manager-dev-api.azurewebsites.net/api/Account/login'),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json-patch+json',
      },
      body: jsonEncode(
        <String, String>{
          "email": emailController.text,
          "password": passwordController.text,
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
  void initState() {
    isPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            onChanged: () {
              onChange();
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Vector.png',
                      scale: 1.5,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Upflyte',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Back,',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      'Sign in to Continue',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid password!';
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: !isPassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.all(5),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      color: Colors.black54,
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassWordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF1E374F),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: _isvalid
                      ? () async {
                          if (_formKey.currentState!.validate()) {
                            postData();
                          }
                        }
                      : null,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: _isvalid
                          ? const Color(0xFF1E374F)
                          : const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: _launchUrl,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.fingerprint_outlined,
                  color: Colors.black,
                  size: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
