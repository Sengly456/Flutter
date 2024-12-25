import 'package:flutter/material.dart';
import 'deck_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  void _navigateToDeck(BuildContext context, Map<String, dynamic> deck) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeckScreen(
          deckTitle: deck['title'],
          cards: List<Map<String, String>>.from(deck['cards']),
          onDeckUpdated: (updatedCards) {
            setState(() {
              deck['cards'] = updatedCards;
            });
          },
        ),
      ),
    );
  }

  void _showAddDeckDialog() {
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Deck'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Deck Title',
            border: OutlineInputBorder(),
            hintText: 'Enter deck title',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              if (title.isNotEmpty) {
                setState(() {
                  decks.add({
                    'id': (decks.length + 1).toString(),
                    'title': title,
                    'cards': [],
                  });
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Decks'),
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
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.folder, color: Colors.blue),
                    title: Text(
                      deck['title'] ?? 'Unknown Deck',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('${deck['cards'].length} cards'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => _navigateToDeck(context, deck),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _showAddDeckDialog,
              icon: const Icon(Icons.add),
              label: const Text('Add New Deck'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}