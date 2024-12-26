import 'package:flutter/material.dart';
import 'ask_any_question_page.dart'; // Import the AskAnyQuestionPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI ASSISTANT',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardTheme(
          color: Colors.lightBlueAccent[50],
          shadowColor: Colors.lightBlueAccent,
          elevation: 4,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // Title text color
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Locale _locale = Locale('en', 'US'); // Default language

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI ASSISTANT"),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate_outlined),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Select Language'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('English'),
                          onTap: () {
                            _changeLanguage(const Locale('en', 'US'));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Card(
          elevation: 6,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AskAnyQuestionPage()), // Navigate to chatbot page
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    size: 40,
                    color: Colors.lightBlueAccent, // Change icon color
                  ),
                  SizedBox(height: 10),
                  Text(
                    'AI ASSISTANT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlueAccent, // Change text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
