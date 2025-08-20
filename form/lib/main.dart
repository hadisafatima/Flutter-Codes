import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Form", 
      home: RegistrationForm(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _globalformKey = GlobalKey<FormState>();

  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Form")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _globalformKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameC,

                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "Hadisa Syed",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _emailC,

                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "abcdef@gmail.com",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!value.contains("@")) {
                    return "Invalid Email Address";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordC,

                decoration: InputDecoration(labelText: "Password"),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 8) {
                    return "Password should be of 8 or more characters";
                  } else {
                    return null;
                  }
                },

                obscureText: true,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_globalformKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Registered: ${_nameC.text} ${_emailC.text}",
                        ),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
