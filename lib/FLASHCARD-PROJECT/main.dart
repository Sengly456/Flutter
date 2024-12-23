import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/deck_screen.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/deck') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DeckScreen(
              deckTitle: args['deckTitle'],
              cards: args['cards'],
            ),
          );
        }
        return null;
      },
    );
  }
}
