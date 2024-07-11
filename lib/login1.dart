import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:uts_pemmobile/model/api.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String username, password;
  bool _secureText = true;
  bool _apiCall = false;
  final _key = new GlobalKey<FormState>();

  showhide() {
    if (this.mounted) {
      setState(() {
        _secureText = !_secureText;
      });
    }
  }

  check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      if (this.mounted) {
        setState(() {
          _apiCall = true;
        });
      }
      login();
    }
  }

  login() async {
    final response = await http.post(Baseurl.login as Uri,
        body: {"username": username, "password": password});
    final data = jsonDecode(response.body);

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/uang.jpeg',
                width: 150,
                height: 150,
              ),
              TextFormField(
                onSaved: (e) => username = e!,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12.0)),
              ),
              TextFormField(
                  obscureText: _secureText,
                  onSaved: (e) => password = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12.0),
                    suffixIcon: IconButton(
                      onPressed: showhide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    check();
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[900]),
                    child: Center(
                      child: _apiCall
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              "Masuk",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
