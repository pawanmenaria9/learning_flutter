import 'package:demo/dashboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page", style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (v){
                  if( v == null || v.isEmpty){
                    return 'plese enter username';
                  } else if(v != "admin"){
                     return "Enter Correct Username!!";
                  }
                },
                decoration: InputDecoration(
                  label: Text('user name'),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                validator: (v){
                  if( v == null || v.isEmpty){
                    return "Please Enter Password";
                  } else if(v != "admin"){
                    return "Please Enter Correct Password!!";
                  }
                },
                decoration: InputDecoration(
                  label: Text("Password"),
                    border: OutlineInputBorder()
                ),
              ),
              ElevatedButton(onPressed: () {
                if(_formKey.currentState!.validate()){
                  print("User Name Is ${_emailController.text}");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
                }
              }, child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}
