import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Card",
      debugShowCheckedModeBanner: false,
      home: ProfileCard(),
    );
  }
}

class ProfileCardsData {
  final List<Map<String, Object>> profiles = [
    {
      "name": "Sophia Lee",
      "bio": "AI & ML Enthusiast with a love for data-driven solutions",
      "age": "26",
      "wanna_be": "Machine Learning Engineer",
      "location": "San Francisco, USA",
      "skills": ["Python", "TensorFlow", "Data Science"],
      "quote": "Turning data into decisions.",
    },
    {
      "name": "Ali Khan",
      "bio": "Mobile App Developer passionate about Flutter and Dart",
      "age": "23",
      "wanna_be": "Tech Entrepreneur",
      "location": "Karachi, Pakistan",
      "skills": ["Flutter", "Firebase", "UI/UX"],
      "quote": "Code is like humor. When you have to explain it, it’s bad.",
    },
    {
      "name": "Fatima Zahra",
      "bio": "Computer Science student passionate about networks",
      "age": "21",
      "wanna_be": "Network Security Specialist",
      "location": "Lahore, Pakistan",
      "skills": ["Networking", "Linux", "Cybersecurity"],
      "quote": "Secure today, safe tomorrow.",
    },
    {
      "name": "David Miller",
      "bio": "Backend Developer specialized in Node.js and Databases",
      "age": "28",
      "wanna_be": "Cloud Architect",
      "location": "New York, USA",
      "skills": ["Node.js", "MongoDB", "AWS"],
      "quote": "Building the invisible that powers the visible.",
    },
    {
      "name": "Sara Ahmed",
      "bio": "Full-stack Developer and open-source contributor",
      "age": "27",
      "wanna_be": "CTO",
      "location": "Dubai, UAE",
      "skills": ["React", "Django", "GraphQL"],
      "quote": "Code. Contribute. Create impact.",
    },
  ];
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profiles",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ),

      body: ListView.builder(
        itemCount: ProfileCardsData().profiles.length,
        itemBuilder: (context, index) {
          final p = ProfileCardsData().profiles[index];
          final skills = p["skills"] as List<String>;

          return Card(
            margin: const EdgeInsets.all(32.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile image, name, location and age
                  Row(
                    children: [
                      // profile image
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.add_reaction_rounded),
                      ),

                      const SizedBox(width: 15),

                      // name, location and age
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // name
                            Text(
                              "${p["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.purple[400],
                              ),
                            ),

                            const SizedBox(height: 5),

                            // location and age
                            Text(
                              "${p["location"]} • Age: ${p["age"]}",
                              style: TextStyle(color: Colors.greenAccent[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // bio
                  Text(
                    "${p["bio"]}",
                    style: TextStyle(color: Colors.blueGrey.shade600),
                  ),

                  const SizedBox(height: 10),

                  // Wanna be
                  Row(
                    children: [
                      Icon(Icons.star, size: 18, color: Colors.blue),

                      const SizedBox(width: 10),

                      Text("Wanna be: ${p["wanna_be"]}"),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // skills
                  Wrap(
                    spacing: 8,
                    children: skills
                        .map(
                          (skill) => Chip(
                            label: Text(skill),
                            backgroundColor: Colors.purple.shade100,
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '"${p["quote"]}"',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}