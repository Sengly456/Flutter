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

  
}


