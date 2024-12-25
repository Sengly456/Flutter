import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/deck_screen.dart';

void main() {
  runApp(const FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  HomeScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/deck') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DeckScreen(
              deckTitle: args['title'] as String,
              cards: List<Map<String, String>>.from(args['cards'] as List),
              onDeckUpdated: args['onDeckUpdated'] as Function(List<Map<String, String>>),
            ),
          );
        }
        return null;
      },
    );
  }
}