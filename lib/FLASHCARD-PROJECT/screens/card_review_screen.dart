import 'package:flutter/material.dart';

class CardReviewScreen extends StatefulWidget {
  final List<Map<String, String>> cards;

  CardReviewScreen({required this.cards});

  @override
  _CardReviewScreenState createState() => _CardReviewScreenState();
}

class _CardReviewScreenState extends State<CardReviewScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _showAnswer = false;
  bool _isFlipping = false;

  void _flipCard() {
    setState(() {
      _isFlipping = !_isFlipping;
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _showAnswer = !_showAnswer;
        });
      });
    });
  }

  void _nextCard() {
    if (_currentIndex < widget.cards.length - 1) {
      setState(() {
        _currentIndex++;
        _showAnswer = false;
        _isFlipping = false;
      });
    }
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _showAnswer = false;
        _isFlipping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentCard = widget.cards[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Card Review"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _flipCard,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                transform: Matrix4.rotationY(_isFlipping ? 3.14 : 0),
                curve: Curves.easeInOut,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _showAnswer
                        ? currentCard['answer'] ?? 'No Answer'
                        : currentCard['question'] ?? 'No Question',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousCard,
                  child: Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: _nextCard,
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
