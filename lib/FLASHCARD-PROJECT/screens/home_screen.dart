import 'package:flutter/material.dart';
import '../screens/deck_screen.dart';  

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> decks = [
    {
      'id': '1',
      'title': 'Math',
      'cards': [
        {'question': 'What is 2 + 2?', 'answer': '4'},
        {'question': 'What is 3 * 3?', 'answer': '9'},
      ],
    },
    {
      'id': '2',
      'title': 'Science',
      'cards': [
        {'question': 'What planet is closest to the sun?', 'answer': 'Mercury'},
        {'question': 'What gas do plants use for photosynthesis?', 'answer': 'Carbon Dioxide'},
      ],
    },
  ];

  void _navigateToDeck(BuildContext context, String deckTitle, List<dynamic> cardsList) {
    // Convert the dynamic list to List<Map<String, String>>
    final List<Map<String, String>> cards = cardsList.map((card) {
      return {
        'question': card['question'] as String,
        'answer': card['answer'] as String,
      };
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeckScreen(
          deckTitle: deckTitle,
          cards: cards,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard Decks'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: decks.length,
              itemBuilder: (context, index) {
                final deck = decks[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(Icons.folder, color: Colors.blue),
                    title: Text(
                      deck['title'] ?? 'Unknown Deck',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('${deck['cards'].length} cards'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => _navigateToDeck(
                      context,
                      deck['title'] ?? 'Deck',
                      deck['cards'] as List<dynamic>,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement add deck functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add deck functionality coming soon!')),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Add New Deck'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}