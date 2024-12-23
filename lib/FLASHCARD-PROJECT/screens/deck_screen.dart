import 'package:flutter/material.dart';
import 'package:my_app/FLASHCARD-PROJECT/widgets/flashcard_view.dart';


class CardReviewScreen extends StatefulWidget {
  final List<Map<String, String>> cards;

  const CardReviewScreen({
    Key? key,
    required this.cards,
  }) : super(key: key);

  @override
  _CardReviewScreenState createState() => _CardReviewScreenState();
}

class _CardReviewScreenState extends State<CardReviewScreen> {
  int _currentIndex = 0;
  bool _showAnswer = false;

  void _nextCard() {
    if (_currentIndex < widget.cards.length - 1) {
      setState(() {
        _currentIndex++;
        _showAnswer = false;
      });
    }
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _showAnswer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Card Review')),
        body: Center(child: Text('No cards available')),
      );
    }

    final currentCard = widget.cards[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Card Review'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card counter
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Card ${_currentIndex + 1} of ${widget.cards.length}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            
            // Flashcard
            Expanded(
              child: FlashcardView(
                question: currentCard['question'] ?? 'No question available',
                answer: currentCard['answer'] ?? 'No answer available',
                showAnswer: _showAnswer,
                onFlip: () {
                  setState(() {
                    _showAnswer = !_showAnswer;
                  });
                },
              ),
            ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _currentIndex > 0 ? _previousCard : null,
                    icon: Icon(Icons.arrow_back),
                    label: Text('Previous'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _currentIndex < widget.cards.length - 1 ? _nextCard : null,
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}