import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'signin.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Back!!", style: TextStyle(fontSize:30,fontWeight:FontWeight.w900)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Chatty",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email)),                 
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText:"password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        "Log in ",
                        style: TextStyle(color:Colors.white, fontSize: 16),
                        ),
                        onPressed:(){
                          login();
                        },
                      ),
              ),
              const SizedBox(height:10 ,),
              Text.rich(TextSpan(
                text: "Dont have account?",
                style: const TextStyle(
                  color: Colors.black, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: "Register here",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      nextScreen
                      (context, const RegisterPage());
                    }
                  ),
                ]
              ))
            ],
          )
          ),
      ),
    );
  }
}

void login() {
}