import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const WelcomePage(),
        "/questionsPage": (context) => const QuestionsPage(),
        "/resultsPage": (context) => const ResultsPage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Qui`"),),
      body: Center(
        // cross: MainAxisAlignment.center,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Quiz Application",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64.0),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/questionsPage"),
                child: const Text("Press here to start the Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Questions {
  final List<Map<String, Object>> questions = [
    {
      "question": "Find the odd one out: Cat, Dog, Cow, Table",
      "options": ["Cat", "Dog", "Cow", "Table"],
      "answer": 3,
    },
    {
      "question": "Book is to Reading as Knife is to ____?",
      "options": ["Cutting", "Writing", "Cooking", "Drawing"],
      "answer": 0,
    },
    {
      "question": "If 2 + 2 = 8, 3 + 3 = 18, then 4 + 4 = ?",
      "options": ["12", "16", "24", "32"],
      "answer": 2,
    },
    {
      "question": "Find the missing number: 2, 4, 8, 16, ?",
      "options": ["18", "24", "30", "32"],
      "answer": 3,
    },
    {
      "question": "Find the odd one out: Rose, Jasmine, Sunflower, Mango",
      "options": ["Rose", "Jasmine", "Sunflower", "Mango"],
      "answer": 3,
    },
    {
      "question":
          "If all Bloops are Razzies and all Razzies are Lazzies, then all Bloops are ____?",
      "options": ["Lazzies", "Razzies", "Both", "None"],
      "answer": 0,
    },
    {
      "question":
          "Choose the correct analogy: Bird is to Fly as Fish is to ____?",
      "options": ["Run", "Swim", "Walk", "Crawl"],
      "answer": 1,
    },
    {
      "question": "Find the odd number: 2, 4, 8, 10, 16",
      "options": ["2", "4", "8", "10", "16"],
      "answer": 3,
    },
    {
      "question": "Find the missing number: 5, 10, 20, 40, ?",
      "options": ["45", "60", "80", "100"],
      "answer": 2,
    },
    {
      "question":
          "If some cats are dogs and some dogs are horses, then some cats are ____?",
      "options": ["Dogs", "Horses", "Lions", "None"],
      "answer": 0,
    },
    {
      "question": "Book is to Author as Song is to ____?",
      "options": ["Poet", "Writer", "Singer", "Composer"],
      "answer": 3,
    },
    {
      "question": "Which word is different? Pen, Pencil, Eraser, Book",
      "options": ["Pen", "Pencil", "Eraser", "Book"],
      "answer": 3,
    },
    {
      "question": "Find the odd one out: Apple, Banana, Carrot, Orange",
      "options": ["Apple", "Banana", "Carrot", "Orange"],
      "answer": 2,
    },
    {
      "question": "If A = 1, B = 2, Z = 26, then SUM = ?",
      "options": ["54", "56", "58", "60"],
      "answer": 1, // S=19, U=21, M=13 → 19+21+13=53
    },
    {
      "question": "What comes next: A, C, E, G, ?",
      "options": ["H", "I", "J", "K"],
      "answer": 2, // J
    },
    {
      "question":
          "Choose the correct analogy: Hand is to Glove as Foot is to ____?",
      "options": ["Shoe", "Sock", "Slipper", "Boot"],
      "answer": 0,
    },
    {
      "question": "Find the odd one out: Gold, Silver, Copper, Wood",
      "options": ["Gold", "Silver", "Copper", "Wood"],
      "answer": 3,
    },
    {
      "question":
          "If Monday is coded as 135, Tuesday as 246, then Wednesday = ?",
      "options": ["357", "369", "456", "579"],
      "answer": 1,
    },
    {
      "question": "Find the missing term: 3, 6, 12, 24, ?",
      "options": ["36", "48", "60", "72"],
      "answer": 1,
    },
    {
      "question":
          "Choose the correct analogy: Doctor is to Patient as Teacher is to ____?",
      "options": ["Class", "Student", "School", "Book"],
      "answer": 1,
    },
  ];
}

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionsPage();
}

class _QuestionsPage extends State<QuestionsPage> {
  int currentQuestion = 0;
  int? selectedOption;
  int score = 0;

  void nextQuestion() {
    if (selectedOption == Questions().questions[currentQuestion]["answer"]) {
      score++;
    }

    if (currentQuestion < Questions().questions.length - 1) {
      setState(() {
        currentQuestion += 1;
        selectedOption = null;
      });
    } else {
      Navigator.pushReplacementNamed(context, "/resultsPage", arguments: score);
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = Questions().questions[currentQuestion];
    final options =
        Questions().questions[currentQuestion]["options"] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Multiple Choice Questions",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32.0),
        ),
      ),

      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(32.0)),

          Card(
            color: Colors.purple[200],
            elevation: 6,
            margin: const EdgeInsets.all(64.0),
            // shadowColor: Colors.pink,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),

            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${q["question"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...options.asMap().entries.map((entry) {
                      int idx = entry.key;
                      String text = entry.value;
                      return RadioListTile<int>(
                        title: Text(text),
                        value: idx,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: selectedOption == null ? null : nextQuestion,
            child: Text(
              currentQuestion == Questions().questions.length
                  ? "Finish"
                  : "Next",
            ),
          ),
        ],
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int score = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: const Text("Your Results")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Score: $score",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              child: const Text(
                "Restart Quiz",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}