import 'package:flutter/material.dart';
import 'card_review_screen.dart';

class DeckScreen extends StatefulWidget {
  final String deckTitle;
  final List<Map<String, String>> cards;
  final Function(List<Map<String, String>>) onDeckUpdated;

  const DeckScreen({
    Key? key,
    required this.deckTitle,
    required this.cards,
    required this.onDeckUpdated,
  }) : super(key: key);

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  late List<Map<String, String>> cards;

  @override
  void initState() {
    super.initState();
    cards = List<Map<String, String>>.from(widget.cards);
  }

  void _navigateToCardReview(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardReviewScreen(
          cards: cards,
          initialCardIndex: index,
        ),
      ),
    );
  }

  void _showAddCardDialog(BuildContext context) {
    final questionController = TextEditingController();
    final answerController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Card'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                labelText: 'Answer',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final question = questionController.text.trim();
              final answer = answerController.text.trim();
              if (question.isNotEmpty && answer.isNotEmpty) {
                setState(() {
                  cards.add({'question': question, 'answer': answer});
                });
                widget.onDeckUpdated(cards); // Notify HomeScreen about the update
                Navigator.pop(context); // Close dialog
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter both question and answer!')),
                );
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cards in ${widget.deckTitle}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            Expanded(
              child: cards.isNotEmpty
                  ? ListView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        final card = cards[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Icon(Icons.note, color: Colors.orange),
                            title: Text(card['question'] ?? 'No Question'),
                            subtitle: Text('Tap to review'),
                            onTap: () => _navigateToCardReview(context, index),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No cards available. Add some!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showAddCardDialog(context),
                icon: Icon(Icons.add),
                label: Text('Add New Card'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
