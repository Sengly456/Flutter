import 'package:my_app/FLASHCARD-PROJECT/models/card.dart';

class Deck {
  final String id;
  String title;
  List<Flashcard> cards;

  Deck({
    required this.id,
    required this.title,
    this.cards = const [],
  });

  void addCard(Flashcard card) {
    cards.add(card);
  }

  void removeCard(Flashcard card) {
    cards.remove(card);
  }
}


