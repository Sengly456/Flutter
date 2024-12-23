import 'package:flutter/material.dart';

class DeckList extends StatelessWidget {
  final List<Map<String, String>> decks;
  final Function(String) onDeckSelected;

  DeckList({required this.decks, required this.onDeckSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: decks.length,
      itemBuilder: (context, index) {
        final deck = decks[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: Icon(Icons.folder, color: Colors.blue),
            title: Text(deck['title'] ?? 'Unknown Deck'),
            subtitle: Text('${deck['cardCount']} cards'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => onDeckSelected(deck['id'] ?? ''),
          ),
        );
      },
    );
  }
}
