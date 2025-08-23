import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2 Page Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegistrationPage(),
    );
  }
}

// ---------------- PAGE 1 ----------------
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  String gender = "Male";
  String accountType = "Student";
  DateTime? dob;
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Full Name"),
                  validator: (val) => val!.isEmpty ? "Enter name" : null,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email Address"),
                  validator: (val) =>
                      val!.isEmpty ? "Enter email" : null,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val!.length < 6 ? "Min 6 chars" : null,
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Age"),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: gender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  items: ["Male", "Female", "Other"]
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (val) => setState(() => gender = val!),
                ),
                const SizedBox(height: 10),
                const Text("Account Type:"),
                Row(
                  children: [
                    Radio(
                      value: "Student",
                      groupValue: accountType,
                      onChanged: (val) =>
                          setState(() => accountType = val!),
                    ),
                    const Text("Student"),
                    Radio(
                      value: "Professional",
                      groupValue: accountType,
                      onChanged: (val) =>
                          setState(() => accountType = val!),
                    ),
                    const Text("Professional"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(dob == null
                        ? "Select Date of Birth"
                        : "DOB: ${dob!.day}/${dob!.month}/${dob!.year}"),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() => dob = picked);
                        }
                      },
                      child: const Text("Pick Date"),
                    ),
                  ],
                ),
                CheckboxListTile(
                  title: const Text("Accept Terms & Conditions"),
                  value: termsAccepted,
                  onChanged: (val) =>
                      setState(() => termsAccepted = val!),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          termsAccepted &&
                          dob != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProfilePage(
                              name: nameController.text,
                              email: emailController.text,
                              age: ageController.text,
                              gender: gender,
                              accountType: accountType,
                              dob: dob!,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Complete all fields")),
                        );
                      }
                    },
                    child: const Text("SUBMIT"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- PAGE 2 ----------------
class ProfilePage extends StatefulWidget {
  final String name, email, age, gender, accountType;
  final DateTime dob;

  const ProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.accountType,
    required this.dob,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Name: ${widget.name}"),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text("Email: ${widget.email}"),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: Text(
                  "DOB: ${widget.dob.day}/${widget.dob.month}/${widget.dob.year}"),
            ),
            ListTile(
              leading: const Icon(Icons.wc),
              title: Text("Gender: ${widget.gender}"),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: Text("Account Type: ${widget.accountType}"),
            ),
            ListTile(
              leading: const Icon(Icons.numbers),
              title: Text("Age: ${widget.age}"),
            ),
            const Divider(),
            const Text("Rate Our App:", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => rating = index + 1);
                  },
                  child: Icon(
                    Icons.star,
                    size: 40,
                    color: (index < rating) ? Colors.amber : Colors.grey,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Thanks for your feedback, ${widget.name}!"
                      )
                    ),
                  );
                },
                child: const Text("SUBMIT RATING"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}